CREATE TABLE pais(
    id SERIAL PRIMARY KEY,
    nome TEXT NOT NULL
);

CREATE TABLE ator(
    id SERIAL PRIMARY KEY,
    nome TEXT NOT NULL,
    nascimento DATE NOT NULL,
    id_origem INTEGER REFERENCES pais(id)
);

CREATE TABLE categoria(
    id SERIAL PRIMARY KEY,
    nome TEXT NOT NULL
);

CREATE TABLE dvd(
    id SERIAL PRIMARY KEY,
    numero INTEGER NOT NULL,
    codigo INTEGER NOT NULL,
    titulo TEXT NOT NULL,
    id_categoria INTEGER REFERENCES categoria(id)
);

CREATE TABLE estado(
    id SERIAL PRIMARY KEY,
    nome TEXT NOT NULL
);

CREATE TABLE cidade(
    id SERIAL PRIMARY KEY,
    nome TEXT NOT NULL,
    id_estado INTEGER REFERENCES estado(id)
);

CREATE TABLE endereco(
    id SERIAL PRIMARY KEY,
    nome TEXT NOT NULL,
    rua TEXT NOT NULL,
    complemento TEXT,
    bairro TEXT NOT NULL,
    cep TEXT NOT NULL
);


CREATE TABLE cliente(
    id SERIAL PRIMARY KEY,
    nome TEXT NOT NULL,
    cpf VARCHAR(11)
);

CREATE TABLE cliente_endereco(
    id_cliente INTEGER REFERENCES cliente(id),
    id_endereco INTEGER REFERENCES endereco(id)
);

CREATE TABLE telefone(
    id SERIAL PRIMARY KEY,
    telefone INTEGER NOT NULL
);

CREATE TABLE cliente_telefone(
    id_cliente INTEGER REFERENCES cliente(id),
    id_telefone INTEGER REFERENCES telefone(id)
);

CREATE TABLE locacao(
    id SERIAL PRIMARY KEY,
    data_locacao DATE NOT NULL,
    data_devolucao DATE,
    nota_atendimento INTEGER,
    id_cliente INTEGER REFERENCES cliente(id)
);

CREATE TABLE locacao_dvd(
    id_dvd INTEGER REFERENCES dvd(id),
    id_locacao INTEGER REFERENCES locacao(id)
);

CREATE TABLE dvd_ator(
    id_ator INTEGER REFERENCES ator(id),
    id_dvd INTEGER REFERENCES dvd(id)
);
