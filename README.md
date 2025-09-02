#Sistema Controle de Estoque - Loja de Roupas

## Funcionalidades

- Cadastro de **produtos** com categoria, cor, tamanho e preço
- Controle de **estoque por loja**
- Registro automático de **movimentações de entrada e saída**
- Registro de **vendas e itens vendidos**
- Controle de **usuários (admin, gerente, vendedor)**
- Relatórios (via **views**) para análise de estoque e vendas

## Estrutura do Banco

- **Produto** → cadastro de produtos
- **Estoque** → quantidade disponível por loja
- **Venda / ItemVenda** → registro de vendas
- **Movimentacoes** → entradas, saídas e transferências
- **Usuario** → controle de usuários do sistema

O esquema foi projetado com **chaves estrangeiras, constraints, triggers e procedures** para manter a consistência dos dados.

## Organização do Repositório

📦 estoque-loja-sql
┣ 📜 01_schema.sql → criação das tabelas
┣ 📜 02_inserts.sql → dados de exemplo
┣ 📜 03_triggers.sql → triggers de movimentação automática
┣ 📜 04_views.sql → relatórios e consultas prontas
┣ 📜 05_procedures.sql → operações comuns (venda, reposição, transferência)
┗ 📜 README.md → documentação do projeto

