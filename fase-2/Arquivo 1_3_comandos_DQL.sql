-- a) Crie uma consulta SQL por meio do comando SELECT que exiba 
-- informações das categorias de produto e respectivos produtos de cada categoria. 
-- Exiba as seguintes informações: código e nome da categoria, código e descrição do produto,
-- valor unitário, tipo de embalagem e percentual do lucro de cada produto.
-- Caso exista alguma categoria sem produto, favor exibir a categoria e deixar os dados do produto em branco.
-- Classifique a consulta por ordem de nome de categoria e nome de produto, ambos de forma ascendente.

SELECT MC_CATEGORIA_PROD.CD_CATEGORIA,
       MC_CATEGORIA_PROD.DS_CATEGORIA,
       MC_PRODUTO.CD_PRODUTO,
       MC_PRODUTO.DS_PRODUTO,
       MC_PRODUTO.VL_UNITARIO, 
       MC_PRODUTO.TP_EMBALAGEM,
       MC_PRODUTO.VL_PERC_LUCRO
FROM   MC_PRODUTO
INNER JOIN MC_CATEGORIA_PROD
ON Mc_Produto.Cd_Categoria = Mc_Categoria_Prod.Cd_Categoria
ORDER BY MC_CATEGORIA_PROD.DS_CATEGORIA, MC_PRODUTO.DS_PRODUTO ASC

-- b) Crie uma instrução SQL que exiba os dados dos clientes pessoas físicas. 
-- Exiba as seguintes informações: 
-- código e nome do cliente, e-mail, telefone, login, data de nascimento, 
-- dia da semana da data de nascimento, anos de vida, sexo biológico e CPF.

SELECT  MC_CLIENTE.NM_CLIENTE,
        MC_CLIENTE.DS_EMAIL,
        MC_CLIENTE.NR_TELEFONE,
        MC_CLIENTE.NM_LOGIN,
        MC_CLI_FISICA.DT_NASCIMENTO,
        EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM MC_CLI_FISICA.DT_NASCIMENTO) AS "ANOS_DE_VIDA",
        MC_CLI_FISICA.FL_SEXO_BIOLOGICO,
        MC_CLI_FISICA.NR_CPF
FROM    MC_CLI_FISICA
INNER JOIN MC_CLIENTE
ON MC_CLI_FISICA.NR_CLIENTE = MC_CLIENTE.NR_CLIENTE

-- c) Exiba as seguintes informações da tabela de visualização dos vídeos dos produtos: 
--código do produto, nome do produto, data e hora de visualização do produto. 
--Exiba essas informações classificadas pela data e hora mais recente.

SELECT  mc_produto.cd_produto, 
        mc_produto.ds_produto,
        mc_sgv_visualizacao_video.dt_visualizacao, 
        mc_sgv_visualizacao_video.nr_hora_visualizacao
FROM    mc_produto
JOIN    mc_sgv_visualizacao_video
ON  mc_produto.cd_produto = mc_sgv_visualizacao_video.cd_produto
ORDER BY 
    mc_sgv_visualizacao_video.dt_visualizacao DESC, 
    mc_sgv_visualizacao_video.nr_hora_visualizacao DESC;


