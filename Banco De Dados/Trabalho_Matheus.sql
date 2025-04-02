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
	constraint fk_ator foreign key (id_ator) references ator(id_ator),
	constraint fk_filme foreign key (id_filme) references filme(id_filme)
)

create table filme_categoria(
	id serial primary key,
	id_filme int,
	id_categoria int,
	constraint fk_filme foreign key (id_filme) references filme(id_filme),
	constraint fk_categoria foreign key (id_categoria) references categoria(id_categoria)
)


insert into filme (descricao) values ('guerra civil'),('vingadores ultimato'),('Guardiões da galaxia'),('Homem de ferro'),('Pantera negra');

insert into ator(nome,sobrenome,idade) values ('Chris', 'Evans', 43),('Robert', 'Downey', 60),('Chris', 'Hemsworth', 41),('Scarlett', 'Johansson', 40),('Chadwick', 'Boseman', 48),('Tom', 'Holland', 28),('Mark', 'Ruffalo', 57),('Brie', 'Larson', 35),
('Chris', 'Pratt', 45),('Zoe', 'Saldana', 46);

insert into categoria (genero, censura) values ('Ação', '14'),('Aventura', '14'),('Comédia', '14');

insert into filme_categoria (id_filme,id_categoria) values (1,1),(2,1),(3,2),(4,2),(5,3);

insert into filme_ator (id_ator, id_filme) values (1,1),(2,4),(3,2),(4,2),(5,5),(6,1),(7,1),(8,2),(9,3),(10,3),(2,3),(3,4),(1,4),(10,5),(7,5);

update ator set idade = '15' where idade = '60';

update filme set duracao = '00:00';

update ator set nome = 'Błaszczykowski' where nome like '%m%' or nome like '%M%';

delete from ator

create table cidade(
	id_cidade serial primary key,
	descricao varchar(100),
	inscricao_estadual int
)

create table endereco(
	id serial primary key,
	logradouro varchar (255),
	numero varchar (10),
	complemento varchar (255),
	cep int,
	descricao varchar (255),
	id_cidade int,
	constraint fk_cidade foreign key (id_cidade) references cidade (id_cidade)
)

insert into endereco (logradouro, numero, complemento, cep, descricao, id_cidade) values ('Rua João Merlim', '1367', 'Universitário', 85819040, 'Residencial', '1'),('Rua Recife', '2283', 'Centro', 85810031, 'Senac - Instituição de Ensino', '1'),('A. Toledo', '432', 'Centro', 85810230, 'Estação de Compras', '1');

insert into cidade (descricao, inscricao_estadual) values ('Cascavel', 123456789), ('Tupãssi', 987654321),('Cafelandia', 123459876);

insert into endereco (logradouro, numero, complemento, cep, descricao, id_cidade)
	values ('Rua Pernambuco', '1843', 'Centro', 85810021, 'Câmara Municipal', 1 );

delete from endereco where descricao like 'Senac'

select*from endereco

delete from cidade