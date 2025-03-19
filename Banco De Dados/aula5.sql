create table idioma(
	id_idioma serial primary key,
	nome varchar(20),
	local varchar(20),
	surgimento varchar(30)
);

create table filme(
	id_filme serial primary key,
	nome varchar(20),
	classificacao int,
	tema varchar(20)
);

create table ator(
	id_ator serial primary key,
	nome varchar(20),
	nacionalidade varchar(20),
	idade int
);

create table ator_filme(
	id_ator_filme serial primary key,
	id_ator int, 
	id_filme int,
	constraint fk_ator foreign key (id_ator) references ator(id_ator),
	constraint fk_filme foreign key (id_filme) references filme(id_filme)
);

insert into idioma (nome) values ('Portugues'),('Ingles'),('Espanhol'),('Italiano'),('Frances'),('Japones'),('Chines');
insert into filme (nome) values ('guerra civil'),('vingadores ultimato'),('Breaking bad');
insert into ator (nome) values ('thor'),('Hulk'),('Homem de ferro'),('Capitao america'),('Walter White'),('Jesse Pinkman'),('Saul Goodman');
select*from ator_filme