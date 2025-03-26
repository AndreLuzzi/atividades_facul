create table ator(
	id_ator serial primary key,
	nome varchar(80),
	sobrenome varchar(80),
	idade int
)

create table filme(
	id_filme serial primary key,
	descricao varchar(100),
	duracao time
	
)
	
create table categoria(
	id_categoria serial primary key,
	genero varchar(100),
	censura varchar(50)
)

create table filme_ator(
	id serial primary key,
	id_ator int,
	id_filme int,
	constraint fk_ator foreign key (id_ator) references ator(id_ator)
	constraint fk_filme foreign key (id_filme) references filme(id_filme)
)

create table filme_categoria(
	id serial primary key,
	id_filme int,
	id_categoria int,
	constraint fk_filme foreign key (id_filme) references filme(id_filme)
	constraint fk_categoria foreign key (id_categoria) references categoria(id_categoria)
)


insert into filme (descricao) values ('guerra civil'),('vingadores ultimato'),('Guardiões da galaxia'),('Homem de ferro'),('Pantera negra');

insert into ator(nome,sobrenome) values ('Anthony; Russo'),('Joe; Russo'),('Anthony;Russo'),('Joe;Russo'),('James; Gunn'),('Jon;Favreau'),('Mark;Fergus'),('Hawk;Ostby'),
('Ryan;Coogler'),('Joe;Robert');

insert into categoria

