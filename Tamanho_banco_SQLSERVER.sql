SELECT DB.name, SUM(size) * 8 AS Tamanho FROM sys.databases DB
INNER JOIN sys.master_files
ON DB.database_id = sys.master_files.database_id
GROUP BY DB.name

-- drop proc sp_espacotabelabanco
-- exec sp_espacotabelabanco
create proc sp_espacotabelabanco
as
 
/*
  Segunda versão do cálculo do tamanho das tabelas, que trata todos os bancos da instância onde 
  for executada.
*/
 
  set nocount on

  declare @vname   varchar(100)
  declare @vbase   varchar(100)
  declare @sql     varchar(max)
  
  create table #tmpTamTabela (
    db         varchar(100) null
  , name       varchar(100) null
  , rows       int          null
  , reserved   varchar(25)  null
  , data       varchar(25)  null
  , index_size varchar(25)  null
  , unused     varchar(25)  null )
  
  create table #tmpTabelas (
    tabela varchar(100) null
  )
  
  declare cp0 cursor local fast_forward read_only for
    select name
     from master..sysdatabases
    /* ESPECIFIQUE AQUI AS EXCEÇÕES PARA CÁLCULO */ 
    where name not in ('master', 'tempdb', 'model', 'msdb')
    order by name
  
  open cp0
  
  while 0 =0 
  begin
    fetch next from cp0 into @vbase
    if @@fetch_status <> 0 break
    
    truncate table #tmpTabelas
    
    select @sql = '
        
          insert into #tmpTabelas (tabela)
            select name
              from [' + rtrim(@vbase) + ']..sysobjects
             where type = ''U''
            
            '
    
    exec(@sql)

    declare cp1 cursor local fast_forward read_only for
      select tabela from #tmpTabelas
       order by 1
   
    open cp1
   
    while 1 = 1
    begin
      fetch next from cp1 into @vname
      if @@fetch_status <> 0 break
      
      select @sql = '
        
          insert into #tmpTamTabela (name, rows, reserved, data, index_size, unused)
            exec [' + rtrim(@vbase) + ']..sp_spaceused ''' + rtrim(@vname) + '''
            
          update #tmpTamTabela
             set db = ''' + rtrim(@vbase) + '''
           where db is null
            
            '
      
      exec(@sql)
      
    end
    close cp1
    deallocate cp1    
    
  end
  close cp0
  deallocate cp0
  
  select db as 'Banco'
       , name as 'Nome'
       , rows as 'Linhas'
       , convert(int, replace(reserved, ' KB','')) as 'Tamanho total KB'
       , convert(int, replace(data, ' KB',''))as 'Dados KB'
       , convert(int, replace(index_size, ' KB',''))as 'Index KB'
       , convert(int, replace(unused, ' KB',''))as 'Não utilizado KB'
    from #tmpTamTabela
   order by db, convert(int, replace(reserved, ' KB','')) desc  