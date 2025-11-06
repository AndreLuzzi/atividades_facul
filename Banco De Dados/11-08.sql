create table ator (
	id_ator serial primary key,
	nome varchar(40)
)

create table filme(
	id_filme serial primary key,
	nome varchar(40)
)

create table filme_ator(
	id_filme_ator serial primary key,
	id_ator int,
	id_filme int,
	constraint fk_filme foreign key (id_filme) references filme(id_filme),
	constraint fk_ator foreign key (id_ator) references ator(id_ator)
)

create table ator_cache(
	id_cache serial primary key,
	id_filme_cache
	id_ator int,
	constraint fk_ator foreign key (id_ator) references ator(id_ator)
)

insert into ator (nome) values ('Kleber'),('Robertinho'),('Rogerio'),('Klovis'),('Samira');
insert into filme (nome) values ('Lalaland'),('Mundinho'),('Perdidamente'),('Achadamente'),('Filmao');

create or replace function calculosmatematicos
	(x int, y int, out soma int, out subtracao int, out multiplicacao int, out divisao int) as $$
begin
	soma = x + Y;
	subtracao = x - y;
	multiplicacao = x * y;
	divisao = x / y;
end;
	$$ language plpgsql;

select * from calculosmatematicos(2,5)

