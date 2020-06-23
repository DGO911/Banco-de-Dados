Select b.ter_identificacao_empresa, count(a.TER_CODIGO) as qtd from gtw_cartao_fila a 
inner join gtw_terminal b on a.ter_codigo = b.ter_codigo
where a.ter_codigo in 
(Select ter_codigo from gtw_terminal where tes_codigo = 1) group by b.ter_identificacao_empresa, a.ter_codigo order by 2 desc;