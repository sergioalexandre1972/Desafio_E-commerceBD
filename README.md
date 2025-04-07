
# 🛒 Projeto E-commerce - Sistema de Gerenciamento de Loja Virtual

Este projeto é uma modelagem completa de um sistema de E-commerce, com foco na criação do banco de dados relacional, incluindo o diagrama entidade-relacionamento (DER), scripts SQL para criação e popular as tabelas, e queries avançadas para análise de dados.

---

## 📌 Funcionalidades do Projeto

- Cadastro de clientes (Pessoa Física e Jurídica)
- Cadastro e gerenciamento de produtos
- Gestão de estoque e fornecedores
- Registro de pedidos e entregas
- Gerenciamento de formas de pagamento
- Vendas por vendedores terceiros
- Relatórios avançados com SQL

---

## 🧱 Estrutura do Banco de Dados

O banco foi modelado com base em um DER estendido que contempla:

- **Clientes** (ClientePF e ClientePJ com especialização)
- **Produtos** (com associação a fornecedores e vendedores)
- **Pedidos** (vinculados a clientes, formas de pagamento e entregas)
- **Entrega** (com status e código de rastreio)
- **Estoque** (com múltiplas localizações)
- **Vendedores Terceiros**
- **Pagamentos**
- **Relacionamentos N:N** entre produtos, fornecedores, estoques e vendedores

---

## 🗃️ Scripts SQL

- **Criação das Tabelas**: Estrutura completa com `PRIMARY KEY`, `FOREIGN KEY`, `NOT NULL`, `UNIQUE`, entre outras `CONSTRAINTS`.
- **Inserções de Dados**: 7 registros para cada tabela com produtos variados como móveis, eletrônicos, vestuário, brinquedos e alimentos.
- **Consultas SQL**: 22 queries criadas para análise e manipulação de dados.

---

## 📊 Exemplos de Consultas SQL

**1. Quantos pedidos foram feitos por cada cliente?**
```sql
SELECT 
    c.idCliente,
    CONCAT(c.pNome, ' ', c.Sobrenome) AS NomeCliente,
    COUNT(p.idPedido) AS TotalPedidos
FROM Cliente c
LEFT JOIN Pedido p ON c.idCliente = p.Cliente_idCliente
GROUP BY c.idCliente, c.pNome, c.Sobrenome;
```

**2. Produtos mais vendidos:**
```sql
SELECT 
    pr.Descrição,
    SUM(pp.Quantidade) AS QuantidadeTotal
FROM Produto pr
JOIN `Produto/pedido` pp ON pr.idProduto = pp.Produto_idProduto
GROUP BY pr.idProduto, pr.Descrição
ORDER BY QuantidadeTotal DESC;
```

**3. Pedidos com entrega pendente (sem código de rastreio):**
```sql
SELECT 
    idPedido, Status, Codigo_rastreio
FROM Pedido
WHERE Codigo_rastreio IS NULL OR Codigo_rastreio = '';
```

---

## 🧠 Técnicas Utilizadas

- Modelagem Entidade-Relacionamento (MER/ER)
- Chaves primárias e estrangeiras
- Relacionamentos 1:N e N:N
- Consultas SQL avançadas com:
  - `JOIN`
  - `GROUP BY`, `ORDER BY`, `HAVING`
  - Filtros com `WHERE`
  - Atributos derivados com expressões (`SUM`, `COUNT`)
  - Subqueries e agrupamentos

---

## 💻 Tecnologias

- **MySQL Workbench**
- **SQL ANSI**
- **Draw.io** (para criação do DER)

---

## 📂 Organização dos Arquivos

```
📦 ecommerce-db
 ┣ 📄 create_tables.sql
 ┣ 📄 insert_data.sql
 ┣ 📄 queries.sql
 ┣ 📄 E-commerceFinal.png
 ┗ 📄 README.md
```

---

## 🚀 Como Executar

1. Importe os scripts no seu MySQL Workbench ou outro gerenciador SQL
2. Execute `create_tables.sql` para criar o esquema
3. Execute `insert_data.sql` para popular os dados
4. Utilize `queries.sql` para explorar os dados

---

## 📚 Autor

**Desenvolvido por:** [Sérgio Alexandre]  
**LinkedIn:** [https://www.linkedin.com/in/s-alexandre-silva-202a1984/inkedin.com/in/seu-perfil](https://linkedin.com/in/s-alexandre-silva-202a1984)  
**GitHub:** [github.com/seuusuario](https://github.com/seuusuario)

---

## 📝 Licença

## 📜 Licença
Este projeto é de livre uso para aprendizado e desenvolvimento de sistemas de gerenciamento de E-commerce.
