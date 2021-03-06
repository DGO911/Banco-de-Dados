create or replace TRIGGER LOGS_VEICULO
BEFORE UPDATE
ON GTW_VEICULO
FOR EACH ROW
DECLARE 
BEGIN
	Insert into LOG values (
						   (Select case  when max(idlog) is null then 0 else max(idlog) end from LOG) + 1, 
							SYSDATE,
              'Veiculo '||:old.VEI_CODIGO||' Desc: '||:old.VEI_IDENTIFICACAO_EMPRESA||' Foi alterado para',
              :old.VEI_CODIGO,
              :old.PRO_CODIGO,
              :old.CAR_CODIGO,
              :old.FIL_CODIGO,
              :old.VTI_CODIGO,
              :old.UNC_CODIGO,
              :old.CEC_CODIGO,
              :old.VEI_IDENTIFICACAO_EMPRESA,
              :old.VEI_PRECO_POR_LITRO,
              :old.VEI_LIMITE_ABASTECIMENTO,
              :old.VEI_OBSERVACAO,
              :old.VEI_MENSAGEM_OFFLINE,
              :old.VEI_ODOMETRO,
              :old.VEI_HORIMETRO,
              :old.VEI_COTA_DATA_BASE,
              :old.VEI_COTA_VENCIMENTO,
              :old.VEI_COTA_VOLUME_LIMITE,
              :old.VEI_COTA_DIAS_VENCIMENTO,
              :old.VEI_COTA_CONTROLADA,
              :old.VEI_COTA_ADICIONAL_PERIODO,
              :old.VEI_COTA_MENSAL,
              :old.VEI_ODO_CONSUMO_MINIMO,
              :old.VEI_ODO_CONSUMO_MAXIMO,
              :old.VEI_HOR_CONSUMO_MINIMO,
              :old.VEI_HOR_CONSUMO_MAXIMO,
              :old.VEI_ATIVO,
              :old.VEI_RAVH,
              :old.VEI_DESCRICAO,
              :old.VEI_EXTRA1,
              :old.VEI_EXTRA2,
              :old.VEI_TERCEIRO,
              :old.TCO_CODIGO,
              :old.CAR_CODIGO_ANTIGO);
	Insert into LOG values (
						   (Select case  when max(idlog) is null then 0 else max(idlog)end from LOG) + 1,
							SYSDATE,
              'Veiculo '||:new.VEI_CODIGO||' Desc: '||:new.VEI_IDENTIFICACAO_EMPRESA,
              :new.VEI_CODIGO,
              :new.PRO_CODIGO,
              :new.CAR_CODIGO,
              :new.FIL_CODIGO,
              :new.VTI_CODIGO,
              :new.UNC_CODIGO,
              :new.CEC_CODIGO,
              :new.VEI_IDENTIFICACAO_EMPRESA,
              :new.VEI_PRECO_POR_LITRO,
              :new.VEI_LIMITE_ABASTECIMENTO,
              :new.VEI_OBSERVACAO,
              :new.VEI_MENSAGEM_OFFLINE,
              :new.VEI_ODOMETRO,
              :new.VEI_HORIMETRO,
              :new.VEI_COTA_DATA_BASE,
              :new.VEI_COTA_VENCIMENTO,
              :new.VEI_COTA_VOLUME_LIMITE,
              :new.VEI_COTA_DIAS_VENCIMENTO,
              :new.VEI_COTA_CONTROLADA,
              :new.VEI_COTA_ADICIONAL_PERIODO,
              :new.VEI_COTA_MENSAL,
              :new.VEI_ODO_CONSUMO_MINIMO,
              :new.VEI_ODO_CONSUMO_MAXIMO,
              :new.VEI_HOR_CONSUMO_MINIMO,
              :new.VEI_HOR_CONSUMO_MAXIMO,
              :new.VEI_ATIVO,
              :new.VEI_RAVH,
              :new.VEI_DESCRICAO,
              :new.VEI_EXTRA1,
              :new.VEI_EXTRA2,
              :new.VEI_TERCEIRO,
              :new.TCO_CODIGO,
              :new.CAR_CODIGO_ANTIGO);
END;
