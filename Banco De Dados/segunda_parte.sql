create table segunda_parte(
	nome varchar(30),
	idade int,
	data_nascimento date
)

alter table segunda_parte add column cnpj varchar(30)
	
alter table segunda_parte drop table cnpj varchar(30)
	
insert into segunda_parte (nome,idade,data_nascimento) values
	('andre', 22, '2003-02-15'),
	('leonardo', 20, '2003-02-20'),
	('henrique', 23, '2001-07-17'),
	('alan', 28, '1997-10-17'),
	('leticia', 25, '2000-07-21');

select idade from usuario order by idade desc;

alter table segunda_parte drop column

update table segunda_parte alter column nome to "juquinha irineu percival" where "andre";


