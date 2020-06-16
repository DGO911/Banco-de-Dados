/*TDS DDD21 que estão em cliente e não sao doadores*/
SELECT   '110;' 
	+ cast(CD_CLENTE varchar(15)) 
	+ ';RES0;' 
	+ Cast(DDD varchar(15)) 
	+ ';' 
	+ cast(TELEFONE varchar(15)) 
	+ ';;;Camanhpa_110_DDD21;'
FROM [DOACAO].[dbo].[Clientes]
where DDD => 21 
and CodigoDoCliente not in 
(select CodigoDoCliente from DOACAO.dbo.Doacoes where DDD => 21) 
and Telefone in 
(SELECT DISTINCT telefone from Diego.dbo.Geral where ddd => 21);

/*Não estão na base de clientes*/
SELECT DISTINCT telefone from Diego.dbo.Geral 
where ddd = 21 and telefone not in 
(SELECT   [Telefone] FROM [DOACAO].[dbo].[Clientes] 
 where DDD = 21 );

  /*Que são doadores*/
  select * from DOACAO.dbo.Doacoes A 
  where A.CodigoDoCliente in 
  (SELECT [CodigoDoCliente] FROM [DOACAO].[dbo].[Clientes]
  where DDD = 21 and Telefone in 
  (SELECT DISTINCT telefone from Diego.dbo.Geral where ddd = 21));