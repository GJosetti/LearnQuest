insert into users (user_name,user_role_id, password, email) values('admin',1,'1592916','administrador@gmail.com');
insert into roles (descricao) values('Cargo de Administrador');
insert into roles (descricao) values('Escola');

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
delete from users  where id = 7;

update users set password = 1592916 where id = 3;  

insert into tenants (nome,endereco, membros_qtd) values ('UFPR','Não Sei', 2 );
insert into tenants (nome, endereco, membros_qtd) values ('PUCPR' ,'senhaBacana', 'Prado Velho', 3 );

insert into tenants (nome, endereco, membros_qtd) values ('UTFPR' ,'senhaOriginal', 'Nome de endereço bem grande pra ver o que  DBGrid vai fazer', 2 );
