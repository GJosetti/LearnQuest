-- =========== TABELAS PRINCIPAIS (SEM DEPENDÊNCIAS) ===========

-- Tabela de Funções/Perfis de Usuário
CREATE TABLE roles (
    id BIGSERIAL PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL
);

-- Tabela de Permissões do Sistema
CREATE TABLE permissoes (
    id BIGSERIAL PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL
);

-- Tabela de Trilhas de Aprendizagem
CREATE TABLE trilhas (
    id BIGSERIAL PRIMARY KEY
    
);

-- Tabela de Fases dentro das Trilhas
CREATE TABLE fase (
    id BIGSERIAL PRIMARY KEY
    
);


-- =========== TABELAS DE RELACIONAMENTO E DEPENDENTES ===========

-- Tabela de Ligação entre Funções e Permissões
CREATE TABLE role_permissoes (
    id BIGSERIAL PRIMARY KEY,
    permissao_id BIGINT NOT NULL REFERENCES permissoes(id),
    role_id BIGINT NOT NULL REFERENCES roles(id)
);

-- Tabela de Usuários
CREATE TABLE users (
    id BIGSERIAL PRIMARY KEY,
    user_name VARCHAR(255) NOT NULL,
    user_role_id BIGINT NOT NULL REFERENCES roles(id),
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL
);

-- Tabela de Estudantes
CREATE TABLE estudante (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT NOT NULL REFERENCES users(id),
    coins VARCHAR(100) 
);

-- Tabela de Professores
CREATE TABLE professores (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT NOT NULL REFERENCES users(id)
    
);

-- Tabela de Turmas
CREATE TABLE turmas (
    id BIGSERIAL PRIMARY KEY,
    turma_name VARCHAR(255) NOT NULL,
    professor_id BIGINT NOT NULL REFERENCES professores(id)
);

-- Tabela de Atividades
CREATE TABLE atividades (
    id BIGSERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    professor_id BIGINT NOT NULL REFERENCES professores(id)
);


-- =========== TABELAS DE LIGAÇÃO ===========

-- Liga estudantes às turmas
CREATE TABLE estudante_turma (
    id BIGSERIAL PRIMARY KEY,
    estudante_id BIGINT NOT NULL REFERENCES estudante(id),
    turma_id BIGINT NOT NULL REFERENCES turmas(id)
);

-- Liga turmas às trilhas
CREATE TABLE turma_trilha (
    id BIGSERIAL PRIMARY KEY,
    turma_id BIGINT NOT NULL REFERENCES turmas(id),
    trilha_id BIGINT NOT NULL REFERENCES trilhas(id)
);

-- Liga fases às trilhas
CREATE TABLE fase_trilha (
    id BIGSERIAL PRIMARY KEY,
    fase_id BIGINT NOT NULL REFERENCES fase(id),
    trilha_id BIGINT NOT NULL REFERENCES trilhas(id)
);

-- Liga atividades às fases
CREATE TABLE atividade_fase (
    id BIGSERIAL PRIMARY KEY,
    atividade_id BIGINT NOT NULL REFERENCES atividades(id),
    fase_id BIGINT NOT NULL REFERENCES fase(id)
);














