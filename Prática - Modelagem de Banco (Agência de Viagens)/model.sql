CREATE DATABASE agencia;

CREATE TABLE aeroporto(
    id SERIAL PRIMARY KEY,
    sigla TEXT NOT NULL,
    nome TEXT NOT NULL
);

CREATE TABLE companhias(
    id SERIAL PRIMARY KEY,
    sigla TEXT NOT NULL,
    nome TEXT NOT NULL
);

CREATE TABLE voo(
    id SERIAL PRIMARY KEY,
    sigla TEXT NOT NULL,
    horarioSaida TIMESTAMP NOT NULL,
    horarioChegada TIMESTAMP NOT NULL,
    idOrigem INT REFERENCES aeroporto(id),
    idDestino INT REFERENCES aeroporto(id),
    idCompanhia INT REFERENCES companhias(id)
);