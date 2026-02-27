create table alunos(
	id serial primary key,
	nome varchar(100),
	idade int,
	curso varchar(100),
	matricula int
);

insert into alunos(nome, idade, curso, matricula)
	select
		md5(random()::text),
		(random()*30)::int,
		md5(random()::text),
		(random()*100000)::int
from generate_series(1, 100000);

select*from alunos2

create table alunos2(
	id serial primary key,
	nome varchar(100),
	idade int,
	curso varchar(100),
	matricula int
);

insert into alunos2(nome, idade, curso, matricula)
	select
		md5(random()::text),
		(random()*30)::int,
		md5(random()::text),
		(random()*100000)::int
from generate_series(1, 100000);

CREATE INDEX idx_matricula ON alunos(matricula);

EXPLAIN ANALYZE SELECT * FROM alunos2; 6.609  7.658

EXPLAIN ANALYZE SELECT * FROM alunos;  0.048  8.001



