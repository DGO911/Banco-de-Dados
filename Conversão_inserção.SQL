SELECT cast(CODABAS as int)
      ,cast(HORIMETRO as numeric(10,3))
      ,cast(CODTERM as int)
      ,cast(CODBOMBA as int)
      ,CODUSUARIO
      ,CODVEICULO
      ,cast(DATA_ABAST as datetime2)
      ,cast(ODOMETRO as numeric(10,3))
      ,cast(QTDLITROS as numeric(8,3))
      ,cast(OBS1 as varchar(20))
      ,cast(OBS2 as varchar(20))
      ,cast(OBS3 as varchar(20))
      ,cast(STATUS as smallint)
      ,cast(EXPORTADO as tinyint)
      ,cast(TAG_RAVO as numeric(2,0))
      ,cast(OBS4 as varchar(20))
      ,cast(OBS5 as varchar(20))
      ,cast(SEMBATERIA as char(1))
      into dbo.GT_HIST_ABAS_I
  FROM dbo.ABA_IMPORT