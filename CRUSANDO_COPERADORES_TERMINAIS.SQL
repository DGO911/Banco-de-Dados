-- Marcando operadores para cada terminal na criado, pós versão 2.14.10

Select 'INSERT INTO [dbo].[GTW_OPERACAO_VEICULO]
           ([VEI_CODIGO]
           ,[OPE_CODIGO]
           ,[OPV_ODO_CONSUMO_MINIMO]
           ,[OPV_ODO_CONSUMO_MAXIMO]
           ,[OPV_HOR_CONSUMO_MINIMO]
           ,[OPV_HOR_CONSUMO_MAXIMO]
           ,[OPV_ATIVA])
     VALUES
           (' + cast(v.VEI_CODIGO as varchar) + ',' + cast(o.OPE_CODIGO as varchar) +  
           ',NULL
           ,NULL
           ,NULL
           ,NULL
           ,1)
GO' FROM [GTFROTA_WEB].[dbo].[GTW_VEICULO] v, [GTFROTA_WEB].[dbo].[GTW_OPERACAO] o where v.VEI_CODIGO in(SELECT VEI_CODIGO
  FROM [GTFROTA_WEB].[dbo].[GTW_VEICULO] where VEI_CODIGO not in (SELECT distinct(VEI_CODIGO)
  FROM [GTFROTA_WEB].[dbo].[GTW_OPERACAO_VEICULO]));