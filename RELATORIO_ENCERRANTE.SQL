Select  f.FIL_Nome as "FILIAL",
        t.ter_identificacao_empresa as "TERMINAL",
        b.BOM_IDENTIFICACAO_EMPRESA as "BOMBA",
        v.VEI_IDENTIFICACAO_EMPRESA as "veiculo",
        a.HAS_DATA as "DATA",
        a.HAS_QTD_LITROS "VOLUME",
        a.HAS_ENCERRANTE_ANTES as "Encerrante Inicio",
        a.HAS_ENCERRANTE_DEPOIS as  "Encerrante Final"
from gtw_historico_abastecimento a
join gtw_terminal t on a.ter_codigo = t.ter_codigo
join GTW_BOMBA b on a.bom_codigo = b.bom_codigo
join gtw_veiculo v on a.vei_codigo = v.vei_codigo
join gtw_filial f on a.fil_codigo = f.fil_codigo
where a.bom_codigo = 280 and a.has_data Between to_date('25/10/2019') and to_date('28/10/2019')
order by has_data DESC;