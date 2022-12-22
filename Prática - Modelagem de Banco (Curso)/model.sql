CREATE TABLE turmas(
    id SERIAL PRIMARY KEY,
    codigo TEXT UNIQUE NOT NULL 
);

CREATE TABLE modulos(
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL 
);

CREATE TABLE alunos(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    email TEXT NOT NULL
);

CREATE TABLE projetos(
    id SERIAL PRIMARY KEY,
    data_entrega DATE NOT NULL,
    idModulo INTEGER REFERENCES modulos(id)
);

CREATE TYPE NOTAS AS ENUM ('Abaixo das expectativas','Dentro das Expectativas', 'Acima das Expectativas');

CREATE TABLE aluno_projeto(
    id_aluno INTEGER REFERENCES alunos(id),
    id_projeto INTEGER REFERENCES projetos(id),
    nota NOTAS NOT NULL
);

CREATE TABLE historico(
    id SERIAL PRIMARY KEY,
    id_aluno INTEGER REFERENCES alunos(id),
    id_turma INTEGER REFERENCES turmas(id),
    data_entrada DATE NOT NULL,
    data_saida DATE
);