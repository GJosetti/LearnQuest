# LearnQuest

![STATUS](http://img.shields.io/static/v1?label=STATUS&message=EM%20DESENVOLVIMENTO&color=GREEN&style=flat)


> Sistema de gestão escolar multi-tenancy e gameficação educacional.

## 📋 Índice


- [Sobre](#sobre)
- [Arquitetura](#arquitetura)
- [Tecnologias](#tecnologias)
- [Funcionalidades](#funcionalidades)
- [Instalação](#instalacao)
- [Autor](#feito-por-guilherme-josetti)
---

## 💡 Sobre

O **LearnQuest** é uma solução para a dificuldade na introdução de metodologias gameficadas na educação.

O objetivo é integrar um sistema educacional,  com gestão de usuários, turmas e matérias, à uma plataforma gameficada e que gere engajamento por parte dos alunos. Diferente de outras soluções, este projeto foca em facilitar a gestão escolar ao unir a parte **administrativa** e a **gameficação**.
Além disso o sistema é projetado para facilitar a criação de atividades pelos professores, fornecendo uma interface gráfica e descomplicada para criar atividades lúdicas e criativas que ficam disponibilizadas para o professor aplicar nas turmas que ele quiser.
O sistema também disponibiliza a criação de relatórios que permite os usuários analisarem informações como: Desempenho de estudantes, Frequência no Login de Usuários ou Taxa de acertos de uma atividade específica (exclusiva para os professores analisarem o desempenho das turmas). 

---

## 🏗 Arquitetura

O projeto segue o padrão **MVC**.

### Estrutura de Pastas

```text
src/
├── controllers/     # Rotas e controle de fluxo
├── services/        # Regras de negócio
├── repositories/    # Acesso ao banco (SQL)
└── views/           # Interface
```
O projeto também conta com o uso de **interfaces** com o objetivo de gerar desacoplamento. 

## 🛠 Tecnologias

* Linguagem : Delphi

* Banco de Dados : Postgres

* Infraestrutura : Utilização de Docker para provisionar uma instância de PostgreSQL durante o desenvolvimento, garantindo um ambiente consistente e facilmente reproduzível.

* Bibliotecas: FireDAC, FastReports

## ✨ Funcionalidades

- [x] Cadastro de Tenants (Escolas)

- [x] Criação de Schemas para cada Tenant

- [x] Sistema de Logs do sistema

- [x] Autenticação de Usuário

- [x] Criação de atividades com uma interface visual

- [x] Relatórios Gerenciais

- [x] Dashboards

## 🚀 Instalação
**Pré-requisitos:**

* Git
* RAD Studio 12

**Passo a Passo:**

* Clone o repositório:

* Git clone [https://github.com/GJosetti/LearnQuest.git]

* Crie uma Database

* Execute o arquivo 'Criar Tabelas public.sql' localizado em ```LearnQuest\src\db\migrations\Criar_Tabelas.sql```

* Execute a aplicação: Abra o projeto no Delphi e compile.


### Feito por Guilherme Josetti
