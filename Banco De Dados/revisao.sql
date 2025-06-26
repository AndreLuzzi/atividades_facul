--1
create table tripulacao (
	id_tripulacao serial primary key,
	nome_pirata varchar(100) not null,
	cargo varchar(50),
	recompensa numeric(10,2),
	ativo boolean
)

--2
alter table tripulacao add column data_entrada date not null;

--3
create table navios_saqueados(
	id_navios_saqueados serial primary key,
	nome_navio varchar(100) not null,
	data_saque date,
	quantidade_ouro numeric
)

select*from tripulacao

--4
alter table

--5
alter table tripulacao alter column recompensa not null;

--6
insert into tripulacao (nome_pirata, cargo, recompensa, ativo) values ('Barba Negra', 'Capitao', 5000.00, true), ('Pé de pano', 'Timoneiro', 2000.00, true), ('Mao de Gancho', 'Cozinheiro', 1500.00, false), ('Olho de vidro', 'Canhoneiro', 3000.00, true), ('Garra de fogo', 'Navegador', 2800.00, false), ('Tempestade Azul', 'Espiao', 4500.00, true);

--7
update tripulacao set recompensa = 7000.00 where nome_pirata = 'Barba Negra';

--8
delete from tripulacao where nome_pirata = 'Mao de Gancho';

--9
