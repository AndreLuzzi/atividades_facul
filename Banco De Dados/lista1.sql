--EXERCICIO 1
create table cliente (
	id_cliente  serial primary key,
	nome varchar(100) not null,
	email varchar(150) unique,
	data_nascimento date
);

--EXERCICIO 2
create table pedido(
	id_pedido serial primary key,
	id_cliente int,
	data_pedido date not null,
	Valor_total numeric(10,2) not null,
	constraint fk_cliente foreign key (id_cliente) references cliente (id_cliente)
);

--EXERCICIO 3

--EXERCICIO 4
create table produto(
	id_produto serial primary key,
	nome varchar(200) not null,
	preco numeric(10,2) default 00.0
);

--EXERCICIO 5
alter table produto alter column preco type numeric(10,2);

--EXERCICIO 6
alter table produto add column estoque int;

--EXERCICIO 7
alter table produto drop column estoque;

--EXERCICIO 8
alter table produto add check (nome <>'');

--EXERCICIO 9
alter table produto drop constraint produto_pkey;

--EXERCICIO 10
alter table pedido rename to vendas;

--EXERCICIO 11
--O comando DROP TABLE é usado para descartar uma tabela existente.
--Não será possível descartar uma tabela se ela estiver referenciada por outros objetos, como acionadores, ou se contiver quaisquer dados.

--EXERCICIO 12
--O comando TRUNCATE TABLE remove todas as linhas de uma tabela sem registrar as exclusões de linhas individuais 
--ou seja, remove o conteúdo de uma tabela em uma única instrução.

--EXERCICIO 13
--drop database loja_virtual;

--EXERCICIO 14


--EXERCICIO 15
--alter table produto rename column nome to descricao_produto



