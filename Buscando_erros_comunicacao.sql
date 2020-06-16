
-- buscando strings de comunicação com erro --
SELECT * FROM GTW_TERMINAL_COM_LOG 
         where tel_erro like '%Index and length must refer to a location within the string.
Parameter name: length%'
          and tel_stx='6'
         and tel_data_comunicacao >='01-11-2019' 
         order by tel_data_comunicacao desc;
-- buscando strings de comunicação
SELECT * FROM GTW_TERMINAL_COM_ERRO where TCE_LINHA_COMUNICACAO  like '%STX611112019%';

-- Buscando abastecimento por periodo--
select * from GTW_HISTORICO_ABASTECIMENTO where HAS_DATA between '01-11-2019' and '13-11-2019'
and TER_CODIGO = 24;
-- Busca controle de fluxo status --
select * from GTW_CONTROLE_FLUXO_SITUACAO;