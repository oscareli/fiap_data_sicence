DROP TABLE categoria CASCADE CONSTRAINTS;

DROP TABLE chamado CASCADE CONSTRAINTS;

DROP TABLE classificacao_video CASCADE CONSTRAINTS;

DROP TABLE cliente CASCADE CONSTRAINTS;

DROP TABLE funcionario CASCADE CONSTRAINTS;

DROP TABLE pessoa_fisica_cliente CASCADE CONSTRAINTS;

DROP TABLE pessoa_juridica_cliente CASCADE CONSTRAINTS;

DROP TABLE potencial_cliente CASCADE CONSTRAINTS;

DROP TABLE produto CASCADE CONSTRAINTS;

DROP TABLE status_ativo CASCADE CONSTRAINTS;

DROP TABLE status_chamado CASCADE CONSTRAINTS;

DROP TABLE tipo_chamado CASCADE CONSTRAINTS;

DROP TABLE venda CASCADE CONSTRAINTS;

DROP TABLE video CASCADE CONSTRAINTS;

DROP SEQUENCE seq_pk;

Create Sequence seq_pk
Start With 1
Increment By 1
Nocache;

CREATE TABLE STATUS_ATIVO (
    cod_status_ativo NUMBER DEFAULT seq_pk.NEXTVAL PRIMARY KEY,
    descricao CHAR(1) CHECK (descricao IN ('A', 'I'))
);

CREATE TABLE CATEGORIA (
    cod_categoria NUMBER DEFAULT seq_pk.NEXTVAL PRIMARY KEY,
    cod_status_ativo NUMBER NOT NULL,
    descricao VARCHAR(255) NOT NULL UNIQUE,
    data_inicio DATE NOT NULL,
    data_termino DATE,
    FOREIGN KEY (cod_status_ativo) REFERENCES STATUS_ATIVO(cod_status_ativo)
);

CREATE TABLE PRODUTO (
    cod_produto NUMBER DEFAULT seq_pk.NEXTVAL PRIMARY KEY,
    cod_status_ativo NUMBER NOT NULL,
    cod_categoria NUMBER,
    descricao_normal VARCHAR2(255) NOT NULL UNIQUE,
    descricao_completa VARCHAR2(500) NOT NULL,
    preco_unitario NUMBER(10,2) NOT NULL,
    codigo_de_barras VARCHAR2(100),
    FOREIGN KEY (cod_status_ativo) REFERENCES STATUS_ATIVO(cod_status_ativo),
    FOREIGN KEY (cod_categoria) REFERENCES CATEGORIA(cod_categoria)
);

CREATE TABLE CLASSIFICACAO_VIDEO (
    cod_classificacao_video NUMBER DEFAULT seq_pk.NEXTVAL PRIMARY KEY,
    descricao_classificacao VARCHAR(255) NOT NULL
);

CREATE TABLE CLIENTE (
    cod_Cliente NUMBER DEFAULT seq_pk.NEXTVAL PRIMARY KEY,
    quantide_estrelas NUMBER(5),
    cod_status_ativo NUMBER NOT NULL,
    numero_telefone NUMBER(13),
    login VARCHAR2(255) NOT NULL,
    senha VARCHAR2(255) NOT NULL,
    e_logado CHAR(1) NOT NULL,
    nome_cliente VARCHAR2(255) NOT NULL,
    FOREIGN KEY (cod_status_ativo) REFERENCES STATUS_ATIVO(cod_status_ativo)
);

CREATE TABLE PESSOA_FISICA_CLIENTE (
    cod_cliente NUMBER DEFAULT seq_pk.NEXTVAL PRIMARY KEY,
    cpf NUMBER(11) NOT NULL UNIQUE,
    data_nasc DATE NOT NULL,
    sexo_biologico CHAR(1) NOT NULL,
    genero VARCHAR(50),
    FOREIGN KEY (cod_cliente) REFERENCES CLIENTE(cod_cliente)
);

CREATE TABLE PESSOA_JURIDICA_CLIENTE (
    cod_cliente NUMBER DEFAULT seq_pk.NEXTVAL PRIMARY KEY,
    data_fundacao DATE,
    Cnpj NUMBER(14),
    ie VARCHAR(50),
    FOREIGN KEY (cod_cliente) REFERENCES CLIENTE(cod_cliente)
);


CREATE TABLE VIDEO (
    cod_video NUMBER DEFAULT seq_pk.NEXTVAL PRIMARY KEY,
    cod_status_ativo NUMBER,
    endereco_url_video VARCHAR2(255) NOT NULL,
    data_visualizacao TIMESTAMP NOT NULL,
    contador_de_visualizacoes NUMBER,
    cod_cliente NUMBER,
    cod_produto NUMBER NOT NULL,
    cod_classificacao_video NUMBER,
    FOREIGN KEY (cod_status_ativo) REFERENCES STATUS_ATIVO(cod_status_ativo),
    FOREIGN KEY (cod_cliente) REFERENCES CLIENTE(cod_cliente),
    FOREIGN KEY (cod_produto) REFERENCES PRODUTO(cod_produto),
    FOREIGN KEY (cod_classificacao_video) REFERENCES CLASSIFICACAO_VIDEO(cod_classificacao_video)
);

CREATE TABLE FUNCIONARIO (
    cod_funcionario NUMBER DEFAULT seq_pk.NEXTVAL PRIMARY KEY,
    nome_funcionario VARCHAR2(50) NOT NULL,
    cpf NUMBER(11) NOT NULL UNIQUE,
    email VARCHAR2(255) NOT NULL,
    cargo VARCHAR2(50) NOT NULL,
    nome_departamento VARCHAR2(50) NOT NULL,
    data_nasc DATE NOT NULL,
    numero_telefone NUMBER(13)
);

CREATE TABLE STATUS_CHAMADO (
    cod_status_chamado NUMBER DEFAULT seq_pk.NEXTVAL PRIMARY KEY,
    status_chamado CHAR(1) NOT NULL CHECK (status_chamado IN ('E', 'C', 'F', 'A', 'X')),
    descricao VARCHAR2(255) NOT NULL
);

CREATE TABLE TIPO_CHAMADO (
    cod_tipo_chamado NUMBER DEFAULT seq_pk.NEXTVAL PRIMARY KEY,
    descricao CHAR(20) CHECK (descricao IN ('1 - sugestao', '2 - reclamacao'))
);

CREATE TABLE CHAMADO (
    cod_chamado NUMBER(10) DEFAULT seq_pk.NEXTVAL PRIMARY KEY,
    cod_cliente NUMBER NOT NULL,
    cod_funcionario NUMBER,
    cod_produto NUMBER NOT NULL,
    cod_tipo_chamado NUMBER NOT NULL,
    data_abertura_chamado TIMESTAMP NOT NULL,
    data_fechamento_chamado TIMESTAMP,
    data_atendimento TIMESTAMP,
    cod_status_chamado NUMBER,
    tempo_atendimento INTERVAL DAY TO SECOND,
    satisfacao NUMBER CHECK (satisfacao >= 1 and satisfacao <= 10),
    tipo NUMBER CHECK (tipo IN (1, 2)),
    texto_chamado VARCHAR2(4000) NOT NULL,
    FOREIGN KEY (cod_cliente) REFERENCES CLIENTE(cod_cliente),
    FOREIGN KEY (cod_funcionario) REFERENCES FUNCIONARIO(cod_funcionario),
    FOREIGN KEY (cod_produto) REFERENCES PRODUTO(cod_produto),
    FOREIGN KEY (cod_status_chamado) REFERENCES STATUS_CHAMADO(cod_status_chamado),
    FOREIGN KEY (cod_tipo_chamado) REFERENCES TIPO_CHAMADO(cod_tipo_chamado)
);

-- Regra 24
CREATE TABLE VENDA (
    cod_venda NUMBER DEFAULT seq_pk.NEXTVAL PRIMARY KEY,
    cod_cliente NUMBER NOT NULL,
    cod_produto NUMBER NOT NULL,
    quantidade NUMBER NOT NULL,
    FOREIGN KEY (cod_cliente) REFERENCES CLIENTE(cod_cliente),
    FOREIGN KEY (cod_produto) REFERENCES PRODUTO(cod_produto)
);

-- Regra 24
CREATE TABLE POTENCIAL_CLIENTE (
    cod_produto_comercializado NUMBER DEFAULT seq_pk.NEXTVAL PRIMARY KEY,
    cod_video NUMBER NOT NULL,
    cod_venda NUMBER NOT NULL,
    taxa_conversao_cliente NUMBER NOT NULL,
    taxa_conversao_video NUMBER NOT NULL,
    FOREIGN KEY (cod_video) REFERENCES VIDEO(cod_video),
    FOREIGN KEY (cod_venda) REFERENCES VENDA(cod_venda)
);
