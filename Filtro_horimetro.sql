Select a.has_data, a.vei_codigo, b.vei_identificacao_empresa,c.car_numero,a.has_horimetro  from gtw_historico_abastecimento a 
join gtw_veiculo b on a.vei_codigo = b.vei_codigo
join gtw_cartao c on a.CAR_CODIGO_ABASTECIDO = c.car_codigo
where has_horimetro like '19304%' order by 1 desc;