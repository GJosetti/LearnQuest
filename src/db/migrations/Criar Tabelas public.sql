

CREATE TABLE roles (
    id BIGSERIAL PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL
);

CREATE TABLE users (
    id BIGSERIAL PRIMARY KEY,
    user_name VARCHAR(255) NOT NULL,
    user_role_id BIGINT NOT NULL REFERENCES roles(id),
    user_escola_id int references tenants (id),
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL
);

create table tenants(	
	id bigserial primary key,
	nome varchar not null,
	user_id int references users(id),
	endereco varchar not null,
	membros_qtd int not null
);
