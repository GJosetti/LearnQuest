-- =========== BASE ===========

-- Usuários já devem existir em public.users
-- e templates em public.activity_template

-- Professores precisam existir antes das turmas e fases
CREATE TABLE professores (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT NOT NULL REFERENCES public.users(id) ON DELETE CASCADE
);

-- Estudantes
CREATE TABLE estudante (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
    coins VARCHAR(100)
);

-- =========== ESTRUTURA DE TRILHAS ===========

-- Trilhas = conjuntos de fases
CREATE TABLE trilhas (
    id BIGSERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT,
    created_at TIMESTAMP DEFAULT NOW()
);

-- Fases pertencem a trilhas
CREATE TABLE fase (
    id BIGSERIAL PRIMARY KEY,
    trilha_id BIGINT NOT NULL REFERENCES trilhas(id) ON DELETE CASCADE,
    teacher_id BIGINT REFERENCES professores(id),
    nome VARCHAR(100),
    descricao TEXT,
    order_index INT,
    created_at TIMESTAMP DEFAULT NOW()
);

-- =========== ESTRUTURA DE TURMAS ===========

CREATE TABLE turmas (
    id BIGSERIAL PRIMARY KEY,
    turma_name VARCHAR(255) NOT NULL,
    descricao VARCHAR NOT NULL,
    professor_id BIGINT NOT NULL REFERENCES professores(id) ON DELETE CASCADE
);

-- Liga estudantes às turmas
CREATE TABLE estudante_turma (
    id BIGSERIAL PRIMARY KEY,
    estudante_id BIGINT NOT NULL REFERENCES estudante(id) ON DELETE CASCADE,
    turma_id BIGINT NOT NULL REFERENCES turmas(id) ON DELETE CASCADE
);

-- Liga turmas às trilhas (as turmas seguem trilhas)
CREATE TABLE turma_trilha (
    id BIGSERIAL PRIMARY KEY,
    turma_id BIGINT NOT NULL REFERENCES turmas(id) ON DELETE CASCADE,
    trilha_id BIGINT NOT NULL REFERENCES trilhas(id) ON DELETE CASCADE
);

-- =========== ATIVIDADES ===========

-- Atividades criadas pelos professores
CREATE TABLE atividades (
    id BIGSERIAL PRIMARY KEY,
    template_id BIGINT REFERENCES public.activity_template(id),
    professor_id BIGINT REFERENCES professores(id),
    title VARCHAR(100),
    content_json JSONB NOT NULL,   -- conteúdo preenchido pelo professor
    created_at TIMESTAMP DEFAULT NOW()
);

-- Liga atividades às fases (N:N possível)
CREATE TABLE atividade_fase (
    id BIGSERIAL PRIMARY KEY,
    atividade_id BIGINT NOT NULL REFERENCES atividades(id) ON DELETE CASCADE,
    fase_id BIGINT NOT NULL REFERENCES fase(id) ON DELETE CASCADE,
    ordem INT
);















