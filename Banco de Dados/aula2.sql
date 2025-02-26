create table produto(
	id_produto serial primary key,
	descricao varchar(100),
	nome varchar(255),
	produto_num int,
	preco real,
	produto_grupo_id int,
	constraint fk_produto_grupo foreign key (produto_grupo_id) references produto_grupo(produto_grupo_id)
);

create table produto_grupo(
	produto_grupo_id serial primary key,
	nome_grupo varchar(100),
	cod_grupo numeric
);

alter table produto add column descricao2 text;
alter table produto drop column descricao2;
