create table usuarios(
	id_usuario serial primary key,
	email varchar(80),
	senha varchar(64)
);

create table jogos(
	id_jogo serial primary key,
	nome varchar(40),
	genero varchar(20),
	preco numeric,
	quantidade int
);

create table vendas(
	id_vendas serial primary key,
	id_jogo int,
	data_venda date,
	quantidade int,
	total numeric
);

select*from usuarios
select*from jogos
select*from vendas