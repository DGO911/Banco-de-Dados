-- relatorio de acesso para cada usuario.

Select u.USS_CODIGO as "Codigo Usuario", 
       u.USS_NOME as "Nome Usuario",
       u.USS_USERNAME as "Login",
       u.USS_ATIVO as "Ativo",
       fi.FIL_NOME as "Filial",
       g.GRU_NOME as "TIPO"
from GTW_Usuario_Seguranca u
join GTW_USUARIO_SEGURANCA_FILIAL f on u.USS_CODIGO = f.USS_CODIGO
join GTW_FILIAL fi on f.FIL_CODIGO = fi.FIL_CODIGO
Join GTW_GRUPO_USUARIO GU on u.USS_CODIGO = GU.USS_CODIGO
join GTW_GRUPO g on GU.GRU_CODIGO = g.GRU_CODIGO
where u.USS_ATIVO = 1 and GU.GRU_CODIGO = 3
order by USS_NOME;