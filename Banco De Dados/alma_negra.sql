create table pessoa(
	id_pessoa serial primary key,
	nome_pessoa  varchar(20),
	cpf int,
	data_nascimento date,
	id_gerente int,
	constraint fk_pessoa foreign key (id_gerente) references pessoa (id_pessoa)
)

create table endereco(
	id_endereco serial primary key,
	rua varchar(20),
	id_cidade int
	constraint fk_cidade foreign key (id_cidade) references cidade (id_cidade)
)

create table cidade(
	id_cidade serial primary key,
	nome_cidade varchar(20)
)

create table empregado(
	
)
	
create table empregado_endereco(
	id_empregado_endereco serial primary key,
)
	
create table companhia(
	id_companhia serial primary key,
	nome_companhia varchar(20)
)

create table companhia_endereco(
	id_companhia_endereco serial primary key,
)

