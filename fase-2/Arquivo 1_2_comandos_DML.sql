-- a) Popular a tabela DEPARTAMENTO
INSERT INTO mc_depto (cd_depto, nm_depto, st_depto) VALUES (1, 'COMERCIAL', 'A');
INSERT INTO mc_depto (cd_depto, nm_depto, st_depto) VALUES (2, 'FINANCEIRO', 'A');
INSERT INTO mc_depto (cd_depto, nm_depto, st_depto) VALUES (3, 'SAC', 'A');

-- b) Populando FUNCIONÁRIOS para os departamentos COMERCIAL e FINANCEIRO
-- Departamento COMERCIAL
INSERT INTO mc_funcionario (cd_funcionario, cd_depto, nm_funcionario, dt_nascimento, ds_cargo, vl_salario, st_func) VALUES (1, 1, 'Ana Silva', TO_DATE('1980-06-15', 'YYYY-MM-DD'), 'Vendedor', 2500.00, 'A');
INSERT INTO mc_funcionario (cd_funcionario, cd_depto, nm_funcionario, dt_nascimento, ds_cargo, vl_salario, st_func) VALUES (2, 1, 'Carlos Pereira', TO_DATE('1978-04-22', 'YYYY-MM-DD'), 'Gerente de Vendas', 4500.00, 'A');

-- Departamento FINANCEIRO
INSERT INTO mc_funcionario (cd_funcionario, cd_depto, nm_funcionario, dt_nascimento, ds_cargo, vl_salario, st_func) VALUES (3, 2, 'Julia Martins', TO_DATE('1985-09-30', 'YYYY-MM-DD'), 'Contadora', 4000.00, 'A');

-- c) Popular ESTADOS, CIDADES, BAIRROS e ENDEREÇOS
-- Estado: São Paulo (SP)
INSERT INTO mc_estado (sg_estado, nm_estado) VALUES ('SP', 'São Paulo');
INSERT INTO mc_estado (sg_estado, nm_estado) VALUES ('RJ', 'Rio de Janeiro');

-- Cidades: São Paulo e Rio de Janeiro
INSERT INTO mc_cidade (cd_cidade, sg_estado, nm_cidade) VALUES (1, 'SP', 'São Paulo');
INSERT INTO mc_cidade (cd_cidade, sg_estado, nm_cidade) VALUES (2, 'RJ', 'Rio de Janeiro');

-- Bairros: Pinheiros em São Paulo e Copacabana no Rio de Janeiro
INSERT INTO mc_bairro (cd_bairro, cd_cidade, nm_bairro, nm_zona_bairro) VALUES (1, 1, 'Pinheiros', 'Zona Oeste');
INSERT INTO mc_bairro (cd_bairro, cd_cidade, nm_bairro, nm_zona_bairro) VALUES (2, 2, 'Copacabana', 'Zona Sul');

-- Endereços: Vamos criar apenas para o bairro de Pinheiros como exemplo
INSERT INTO mc_logradouro (cd_logradouro, cd_bairro, nm_logradouro, nr_cep) VALUES (1, 1, 'Rua dos Pinheiros', 05422000);
INSERT INTO mc_logradouro (cd_logradouro, cd_bairro, nm_logradouro, nr_cep) VALUES (2, 1, 'Av. Rebouças', 05402000);

-- d) Cadastro de ENDEREÇO FUNCIONÁRIO para 2 funcionários
-- Vou escolher os funcionários de id 1 e 3, cada um em uma cidade diferente.
INSERT INTO mc_end_func (cd_funcionario, cd_logradouro, nr_end, dt_inicio, st_end) VALUES (1, 1, 100, TO_DATE('2020-01-01', 'YYYY-MM-DD'), 'A');
INSERT INTO mc_end_func (cd_funcionario, cd_logradouro, nr_end, dt_inicio, st_end) VALUES (3, 2, 50, TO_DATE('2020-01-01', 'YYYY-MM-DD'), 'A');

-- e) Cadastro de CLIENTES (PESSOAS FÍSICAS e JURÍDICA) e Endereços
-- Clientes Pessoa Física
INSERT INTO mc_cliente (nr_cliente, nm_cliente, nm_login, ds_senha, st_cliente) VALUES (1, 'João da Silva', 'joaosilva', 'senha123', 'A');
INSERT INTO mc_cli_fisica (nr_cliente, dt_nascimento, fl_sexo_biologico, nr_cpf) VALUES (1, TO_DATE('1990-05-20', 'YYYY-MM-DD'), 'M', '123.456.789-00');

INSERT INTO mc_cliente (nr_cliente, nm_cliente, nm_login, ds_senha, st_cliente) VALUES (2, 'Maria Oliveira', 'mariaoliveira', 'senha456', 'A');
INSERT INTO mc_cli_fisica (nr_cliente, dt_nascimento, fl_sexo_biologico, nr_cpf) VALUES (2, TO_DATE('1985-08-15', 'YYYY-MM-DD'), 'F', '987.654.321-00');

-- Cliente Pessoa Jurídica
INSERT INTO mc_cliente (nr_cliente, nm_cliente, nm_login, ds_senha, st_cliente) VALUES (3, 'Empresa XYZ', 'empresaxyz', 'senha789', 'A');
INSERT INTO mc_cli_juridica (nr_cliente, dt_fundacao, nr_cnpj) VALUES (3, TO_DATE('2000-01-01', 'YYYY-MM-DD'), '12.345.678/0001-99');

-- Endereços para os Clientes
INSERT INTO mc_end_cli (nr_cliente, cd_logradouro_cli, nr_end, dt_inicio, st_end) VALUES (1, 1, 150, TO_DATE('2022-01-01', 'YYYY-MM-DD'), 'A');
INSERT INTO mc_end_cli (nr_cliente, cd_logradouro_cli, nr_end, dt_inicio, st_end) VALUES (2, 2, 250, TO_DATE('2022-01-01', 'YYYY-MM-DD'), 'A');
INSERT INTO mc_end_cli (nr_cliente, cd_logradouro_cli, nr_end, dt_inicio, st_end) VALUES (3, 1, 350, TO_DATE('2022-01-01', 'YYYY-MM-DD'), 'A');

-- f) Tentativa de Cadastro de Novo Cliente com Login Existente
INSERT INTO mc_cliente (nr_cliente, nm_cliente, nm_login, ds_senha, st_cliente) VALUES (4, 'Pedro Alcantara', 'joaosilva', 'senha987', 'A');

-- g) Cadastro de Categorias para Produtos
INSERT INTO mc_categoria_prod (cd_categoria, tp_categoria, ds_categoria, st_categoria) VALUES (1, 'P', 'Eletrônicos', 'A');
INSERT INTO mc_categoria_prod (cd_categoria, tp_categoria, ds_categoria, st_categoria) VALUES (2, 'P', 'Esporte e Lazer', 'A');
INSERT INTO mc_categoria_prod (cd_categoria, tp_categoria, ds_categoria, st_categoria) VALUES (3, 'P', 'Pet Shop', 'A');

-- h) Cadastro de Produtos
INSERT INTO mc_produto (cd_produto, cd_categoria, ds_produto, vl_unitario, ds_completa_prod, st_produto) VALUES (1, 1, 'Smartphone X', 1500.00, 'Smartphone X, última geração', 'A');
-- Adicione mais 4 produtos seguindo o exemplo acima, variando a categoria e os detalhes conforme necessário.

-- i) Cadastro de Categorias para Vídeos
INSERT INTO mc_categoria_prod (cd_categoria, tp_categoria, ds_categoria, st_categoria) VALUES (4, 'V', 'Instalação do produto', 'A');
INSERT INTO mc_categoria_prod (cd_categoria, tp_categoria, ds_categoria, st_categoria) VALUES (5, 'V', 'Uso no cotidiano', 'A');

-- j) Cadastro de Vídeos de Produtos
-- Supondo que as sequências de categoria de vídeos são 4 e 5 para as categorias criadas anteriormente.
INSERT INTO mc_sgv_produto_video (cd_produto, nr_sequencia, cd_categoria, ds_path_video_prod, st_video_prod) VALUES (1, 1, 4, 'path/to/instalacao/video.mp4', 'A');
INSERT INTO mc_sgv_produto_video (cd_produto, nr_sequencia, cd_categoria, ds_path_video_prod, st_video_prod) VALUES (1, 2, 5, 'path/to/uso/cotidiano/video.mp4', 'A');

-- k) Cadastro de Visualizações de Vídeos de Produtos
-- Supondo que os clientes 1 e 2 visualizaram os vídeos.
INSERT INTO mc_sgv_visualizacao_video (cd_visualizacao_video, nr_cliente, cd_produto, nr_sequencia, dt_visualizacao, nr_hora_visualizacao) VALUES (1, 1, 1, 1, TO_DATE('2023-04-01', 'YYYY-MM-DD'), 14);
INSERT INTO mc_sgv_visualizacao_video (cd_visualizacao_video, nr_cliente, cd_produto, nr_sequencia, dt_visualizacao, nr_hora_visualizacao) VALUES (2, 2, 1, 2, TO_DATE('2023-04-01', 'YYYY-MM-DD'), 15);

-- l) Confirme todas as transações pendentes (muito importante).
-- comando será executado ao final de todas as alterações
-- commit;

-- m) Selecione um específico funcionário e atualize o Cargo e aplique 12% de aumento de salário.
UPDATE mc_funcionario 
SET ds_cargo = 'Novo Cargo', 
    vl_salario = vl_salario * 1.12 
WHERE cd_funcionario = 1;

-- n) Atualize o nome de um departamento a sua escolha, utilizando como filtro o nome do departamento antes de ser atualizado.
UPDATE mc_depto 
SET nm_depto = 'Atendimento ao Cliente' 
WHERE nm_depto = 'SAC';

-- o) Atualize a data de nascimento de um cliente pessoa física. Defina a nova data como sendo 18/05/2002.
UPDATE mc_cli_fisica 
SET dt_nascimento = TO_DATE('18-05-2002', 'DD-MM-YYYY') 
WHERE nr_cliente = 1;

-- p) Desative um funcionário colocando o status como I(nativo) e também a data de desligamento como sendo a data de hoje (sysdate).
UPDATE mc_funcionario 
SET st_func = 'I', 
    dt_desligamento = SYSDATE 
WHERE cd_funcionario = 2;


-- q) Selecione um endereço de cliente e coloque o status como I(nativo) e preencha a data de término como sendo a data limite de entrega do trabalho. Utilize a função to_date para registrar esse novo valor da data.
UPDATE mc_end_cli 
SET st_end = 'I', 
    dt_termino = TO_DATE('30-04-2024', 'DD-MM-YYYY') 
WHERE nr_cliente = 1;

-- r) Tente eliminar um estado que tenha uma cidade cadastrada. Isso foi possível? Justifique o motivo.
DELETE FROM mc_estado WHERE sg_estado = 'SP';

-- s) Selecione um produto e tente atualizar o status do produto com o status X. Isso foi possível? Justifique o motivo.
UPDATE mc_produto 
SET st_produto = 'X' 
WHERE cd_produto = 1;

-- t) Confirme todas as transações pendentes.
COMMIT;

