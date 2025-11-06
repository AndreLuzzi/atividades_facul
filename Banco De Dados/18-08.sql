create table pedidos(
	id_pedido serial primary key,
	id_cliente int references clientes(id_cliente),
	data_pedido date default current_timestamp,
	status_pedido varchar(20) default 'aberto'
		check (status_pedido in ('aberto', 'fechado', 'cancelado')),
	total numeric
)

insert into pedidos (id_cliente, status_pedido, total) values (1, 'fechado', )

create table clientes(
    id_cliente serial primary key,
    nome varchar(200) not null,
    email varchar(200) unique not null,
    status_cliente varchar(20) default 'standard'
        check (status_cliente in ('standard', 'gold', 'platinum')),
    data_cadastro date default current_date,
    saldo_credito numeric(12,2) default 0
)

insert into clientes (nome, email, status_cliente, saldo_credito) values 
	('Andre', 'andre@outlook.com', 'platinum', 10000),
	('Leonardo' , 'leonardo@gmail.com', 'standart', 100),
	('Henrique', 'henrique@hotmail.com', 'standart', 100),
	('Alan', 'alan@gmail.com', 'gold', 1000),
	('Letícia', 'leticia@hotmail.com', 'gold', 800)

create table pagamentos(
	id_pagamento serial primary key,
	id_pedido int references pedidos(id_pedido),
	valor numeric not null check (valor > 0),
	data_pagamento date default current_timestamp,
	forma varchar(20) default 'cartao'
		check (forma in ('pix', 'boleto'))
)

create table produtos (
    id_produto serial primary key,
    nome varchar(100) not null,
    preco numeric(12,2) not null check (preco > 0),
    estoque int default 0 check (estoque >= 0),
    ativo boolean default true
)

insert into produtos (nome, preco, estoque, ativo) values
	('mause gamer', 120, 7, true),
	('monitor', 1150, 4, true),
	('RTX6090', 6000, 0, false),
	('teclado gamer', 350, 5, true),
	('mausepad', 100, 15, true)

create table itens_pedido (
    id_item serial primary key,
    id_pedido int references pedidos(id_pedido),
    id_produto int references produtos(id_produto),
    quantidade int not null check (quantidade > 0),
    preco_unit numeric(12,2) not null check (preco_unit >= 0),
    subtotal numeric(12,2) generated always as (quantidade * preco_unit) stored,
    constraint fk_pedido foreign key (id_pedido) references pedidos(id_pedido),
    constraint fk_produto foreign key (id_produto) references produtos(id_produto)
)