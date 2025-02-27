create table pizza(
	id_pizza  serial primary key,
	tamanho varchar(10),
	preco real
	constraint fk_ingredientes foreign key (id_ingrediente) references ingrediente(id_ingrediente)
	constraint fk_sabores foreign key (id_sabor) references sabores(id_sabor)
);

create table ingredientes(
	id_ingrediente  serial primary key,
	nome varchar(30),
	quantidade int,
	descricao varchar(200)
);

create table sabores(
	id_sabor  serial primary key,
	nome varchar(30),
	descricao varchar(200)
);

create table sabores_ingredientes(
	id_sab_ing serial primary key,
constraint fk_ingredientes foreign key (id_ingrediente) references ingrediente(id_ingrediente)
constraint fk_sabores foreign key (id_sabor) references sabor(id_sabor)
);