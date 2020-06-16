--trazendo quantidades de caracteres dos ids--
SELECT len(VEI_IDENTIFICACAO_EMPRESA) t 
	  ,[VEI_CODIGO]
      ,[VEI_IDENTIFICACAO_EMPRESA]
FROM [GTFrota_Web].[dbo].[GTW_VEICULO] order by 1

-- Contando quantos ids começam pela str --
select  count(*) FROM [GTFrota_Web].[dbo].[GTW_VEICULO] 
where VEI_IDENTIFICACAO_EMPRESA like '419%'
select  VEI_IDENTIFICACAO_EMPRESA FROM [GTFrota_Web].[dbo].[GTW_VEICULO] 
where VEI_IDENTIFICACAO_EMPRESA like '0719%'
;
-- update colocando um 0 no inicio do id --

select replace(VEI_IDENTIFICACAO_EMPRESA, VEI_IDENTIFICACAO_EMPRESA, '0' + VEI_IDENTIFICACAO_EMPRESA) from [GTFrota_Web].[dbo].[GTW_VEICULO] 
where VEI_IDENTIFICACAO_EMPRESA like '719%';

update [GTFrota_Web].[dbo].[GTW_VEICULO] 
set VEI_IDENTIFICACAO_EMPRESA = replace(VEI_IDENTIFICACAO_EMPRESA, VEI_IDENTIFICACAO_EMPRESA, '0' + VEI_IDENTIFICACAO_EMPRESA)
where VEI_IDENTIFICACAO_EMPRESA like '419%';