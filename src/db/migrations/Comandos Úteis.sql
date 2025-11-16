insert into users (user_name,user_role_id, password, email) values('admin',1,'1592916','administrador@gmail.com');
insert into roles (descricao) values('Cargo de Administrador');
insert into roles (descricao) values('Escola');
insert into roles (descricao) values ('Professor');
insert into roles (descricao) values ('Estudante');

select * from roles

delete from users  where id = 3;
select *from users; 
select user_name, roles.descricao from users inner join roles on user_role_id = roles.id;

DROP TABLE IF EXISTS atividade_fase CASCADE;
DROP TABLE IF EXISTS fase_trilha CASCADE;
DROP TABLE IF EXISTS turma_trilha CASCADE;
DROP TABLE IF EXISTS estudante_turma CASCADE;
DROP TABLE IF EXISTS atividades CASCADE;
DROP TABLE IF EXISTS turmas CASCADE;
DROP TABLE IF EXISTS professores CASCADE;
DROP TABLE IF EXISTS estudante CASCADE;
DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS role_permissoes CASCADE;
DROP TABLE IF EXISTS fase CASCADE;
DROP TABLE IF EXISTS trilhas CASCADE;
DROP TABLE IF EXISTS permissoes CASCADE;
DROP TABLE IF EXISTS roles CASCADE;


drop table tenants;
drop table users ;

select * from tenants;
select *from users; 


delete from tenants where id = 3; 
delete from users  where id = 16;

delete from escola_4.professores where id = 6;
select * from escola_49.estudante e ;
select * from escola_49.professores;

delete from escola_4.estudante where id = 1;
delete from escola_4.professores where id = 5;

update users set password = 1592916 where id = 3;  

insert into tenants (nome,endereco, membros_qtd) values ('UFPR','Não Sei', 2 );
insert into tenants (nome, endereco, membros_qtd) values ('PUCPR' ,'senhaBacana', 'Prado Velho', 3 );

insert into tenants (nome, endereco, membros_qtd) values ('UTFPR' ,'senhaOriginal', 'Nome de endereço bem grande pra ver o que  DBGrid vai fazer', 2 );




INSERT INTO public.activity_template (name, description, structure_json)
VALUES (
  'Quiz de múltipla escolha',
  'Atividade de perguntas com múltiplas opções e uma resposta correta.',
  '{
    "type": "quiz",
    "fields": {
      "title": "string",
      "description": "string",
      "questions": [
        {
          "question": "string",
          "options": ["string"],
          "correct_index": "integer"
        }
      ]
    },
    "rules": {
      "min_questions": 1,
      "max_questions": 10
    }
  }'::jsonb
);
INSERT INTO public.activity_template (name, description, structure_json)
VALUES (
  'Verdadeiro ou Falso',
  'Atividade com afirmações que devem ser classificadas como verdadeiras ou falsas.',
  '{
    "type": "true_false",
    "fields": {
      "title": "string",
      "description": "string",
      "statements": [
        {
          "text": "string",
          "is_true": "boolean"
        }
      ]
    },
    "rules": {
      "min_statements": 1,
      "max_statements": 10
    }
  }'::jsonb
);

select *from public.activity_template;
select * from escola_73.atividades ;
select * from escola_51.professores p; 

SELECT a.*
FROM escola_73.atividades a
JOIN escola_73.atividade_turma at ON at.atividade_id = a.id
JOIN escola_73.turmas t ON t.id = at.turma_id
JOIN escola_73.estudante_turma et ON et.turma_id = t.id
JOIN escola_73.estudante e ON e.id = et.estudante_id
JOIN public.users u ON u.id = e.user_id
WHERE u.id = :user_id;


select * from login_logs;

ALTER TABLE users ADD COLUMN last_access TIMESTAMP;

select *from  users u;

select u.user_name, ae.sucess from users u inner join escola_74.estudante e on e.user_id = u.id inner join escola_74.atividade_estudante ae on ae.estudante_id = e.id;  

SELECT 
    u.user_name,
    ROUND(100.0 * SUM(CASE WHEN ae.sucess = TRUE THEN 1 ELSE 0 END) / COUNT(*), 2) AS porcentagem_acertos
FROM 
    users u
INNER JOIN 
    escola_74.estudante e ON e.user_id = u.id
INNER JOIN 
    escola_74.atividade_estudante ae ON ae.estudante_id = e.id
GROUP BY 
    u.user_name;


select * from escola_33.atividades; 


INSERT INTO escola_73.atividades (
    template_id,
    professor_id,
    title,
    content_json
) VALUES (
    1,  -- id do template "Quiz de 1 pergunta"
    1,  -- id do professor
    'Quiz teste sobre Capitais',
    '{
        "title": "Quiz teste sobre Capitais",
        "description": "Teste rápido sobre as capitais do Brasil!",
        "question": "Qual é a capital do Amazonas?",
        "options": ["Manaus", "Belém", "Palmas", "Boa Vista"],
        "correct_index": 0
    }'::jsonb
);

INSERT INTO activity_template (id, name, structure_json)
VALUES (
    1,
    'Quiz de 1 pergunta',
    '{
        "type": "quiz",
        "rules": {
            "max_questions": 1,
            "min_questions": 1
        },
        "fields": {
            "title": "string",
            "description": "string",
            "question": "string",
            "options": ["string"],
            "correct_index": "integer"
        }
    }'::jsonb
);

INSERT INTO activity_template (id, name, structure_json)
VALUES (
    2,
    'True/False de 1 pergunta',
    '{
        "type": "true_false",
        "rules": {
            "max_statements": 1,
            "min_statements": 1
        },
        "fields": {
            "title": "string",
            "description": "string",
            "statement": "string",
            "is_true": "boolean"
        }
    }'::jsonb
);



