create table cliente (
    id_cliente serial primary key,
    nome varchar(100),
    nascimento date,
    email varchar(100),
    telefone varchar(20)
)

create table tabela_preco (
    id_tabela serial primary key,
    descricao varchar(100),
    valor numeric(10, 2),
    data_inicio date,
    data_fim date
)

create table condicao_pagamento (
    id_condicao serial primary key,
    nome varchar(100),
    parcelas integer,
    juros numeric(5,2),
    desconto numeric(5,2)
)

create table pedido (
    id_pedido serial primary key,
    id_cliente integer references cliente(id_cliente),
    id_tabela integer references tabela_preco(id_tabela),
    id_condicao integer references condicao_pagamento(id_condicao),
    data_pedido date
)

insert into cliente (nome, nascimento, email, telefone) values
('Ana Souza', '1985-02-10', 'ana@email.com', '44911110001'),('Bruno Lima', '1990-06-15', 'bruno@email.com', '44911110002'),('Carla Dias', '1982-11-22', 'carla@email.com', '44911110003'),('Daniel Rocha', '1975-09-30', 'daniel@email.com', '44911110004'),('Eduarda Mendes', '2000-04-08', 'eduarda@email.com', '44911110005'),('Felipe Silva', '1995-01-20', 'felipe@email.com', '44911110006'),('Giovana Reis', '1988-12-05', 'giovana@email.com', '44911110007');


insert into tabela_preco (descricao, valor, data_inicio, data_fim) values
('Preço Padrão', 100.00, '2020-01-01', '2025-12-31'),('Preço Promo', 80.00, '2022-01-01', '2022-12-31'),('Preço Black', 70.00, '2021-11-01', '2021-11-30'),('Preço Natal', 90.00, '2022-12-01', '2022-12-31'),('Preço Páscoa', 95.00, '2023-04-01', '2023-04-10'),('Preço Verão', 85.00, '2023-01-01', '2023-03-31'),('Preço Inverno', 110.00, '2024-06-01', '2024-09-30');


insert into condicao_pagamento (nome, parcelas, juros, desconto) values
('À Vista', 1, 0.00, 5.00),('2x Sem Juros', 2, 0.00, 0.00),('3x com Juros', 3, 2.50, 0.00),('4x com Juros', 4, 3.00, 0.00),('5x com Juros', 5, 3.50, 0.00),('10x com Juros', 10, 5.00, 0.00),('2x com Desconto', 2, 0.00, 2.00);


insert into pedido (id_cliente, id_tabela, id_condicao, data_pedido) values
(4, 1, 1, '2021-05-15'),(1, 2, 2, '2022-03-10'),(2, 1, 3, '2023-01-20'),(3, 3, 4, '2020-07-25'),(5, 4, 5, '2022-11-11'),(6, 5, 6, '2024-02-02'),(7, 6, 7, '2023-07-17');

select id_pedido
from pedido
where id_cliente = (
    select id_cliente
    from cliente
    order by nascimento asc
    limit 1
)
	
select nome
from condicao_pagamento
where id_condicao = (
    select p.id_condicao
    from pedido p
    join tabela_preco t on p.id_tabela = t.id_tabela
    where p.data_pedido < '2023-01-01'
      and p.data_pedido between t.data_inicio and t.data_fim
    limit 1
)

select c.nome, c.nascimento
from cliente c
join pedido p on c.id_cliente = p.id_cliente
join tabela_preco t on p.id_tabela = t.id_tabela
where t.valor > (
    select avg(t2.valor)
    from pedido p2
    join tabela_preco t2 on p2.id_tabela = t2.id_tabela
)