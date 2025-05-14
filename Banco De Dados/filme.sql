CREATE TABLE ator (
  idator serial PRIMARY KEY,
  nome TEXT NOT NULL
)
	
CREATE TABLE filme (
  idfilme serial PRIMARY KEY,
  nome TEXT NOT NULL
)

CREATE TABLE filme_ator (
  idfilmeator serial PRIMARY KEY,
  idfilme INTEGER,
  idator INTEGER ,
  constraint fk_filme_ foreign key (idfilme) references filme(idfilme),
  constraint fk_ator_ foreign key (idator) references ator(idator)  
)

CREATE TABLE ator_cache (
  idatorcache serial PRIMARY KEY,
  idator INTEGER ,
  cache INTEGER ,
  constraint fk_ator_ foreign key (idator) references ator(idator)  
)

CREATE TABLE ator2 (
  idator serial PRIMARY KEY,
  nome TEXT NOT NULL
)

SELECT A.NOME, C.CACHE FROM ATOR A 
INNER JOIN ATOR_CACHE C
ON A.IDATOR=C.IDATOR

SELECT A.NOME, F.NOME FROM ATOR A 
INNER JOIN FILME_ATOR FA
ON A.IDATOR=FA.IDATOR
INNER JOIN FILME F
ON FA.IDFILME=F.IDFILME

SELECT A.NOME, C.CACHE FROM ATOR A 
left JOIN ATOR_CACHE C
ON A.IDATOR=C.IDATOR

SELECT A.NOME, C.CACHE FROM ATOR A 
RIGHT JOIN ATOR_CACHE C
ON A.IDATOR=C.IDATOR

SELECT A.NOME, C.CACHE FROM ATOR A 
FULL OUTER JOIN ATOR_CACHE C
ON A.IDATOR=C.IDATOR

delete from filme_ator
delete from filme
delete from ator

INSERT INTO ator (nome) VALUES ('Jean Queuri');
INSERT INTO ator (nome) VALUES ('Jean Claudio Andaime');
INSERT INTO ator (nome) VALUES ('Analdo Strogonof');
INSERT INTO ator (nome) VALUES ('Juquinha Snaiders');
INSERT INTO filme (nome) VALUES ('O senho dos pasteis');
INSERT INTO filme (nome) VALUES ('Ary Portas e as reliquias dos chaveiros');
INSERT INTO filme (nome) VALUES ('As paredes do destino');
INSERT INTO filme (nome) VALUES ('Python: a anaconda assassina');
INSERT INTO filme (nome) VALUES ('O mundo sobrio do java');
INSERT INTO filme (nome) VALUES ('Todo mundo programando em C');
INSERT INTO filme_ator (idfilme,idator) VALUES (1,1);
INSERT INTO filme_ator (idfilme,idator) VALUES (1,2);
INSERT INTO filme_ator (idfilme,idator) VALUES (1,3);
INSERT INTO filme_ator (idfilme,idator) VALUES (2,1);
INSERT INTO filme_ator (idfilme,idator) VALUES (2,3);
INSERT INTO filme_ator (idfilme,idator) VALUES (3,3);
INSERT INTO filme_ator (idfilme,idator) VALUES (4,1);
INSERT INTO filme_ator (idfilme,idator) VALUES (4,2);
INSERT INTO filme_ator (idfilme,idator) VALUES (4,3);
INSERT INTO ator_cache (idator,cache) VALUES (1,3000);
INSERT INTO ator_cache (idator,cache) VALUES (2,8000);
INSERT INTO ator2 (nome) VALUES ('Jean Queuri');
INSERT INTO ator2 (nome) VALUES ('Leonardo da Vinti Reais');

select *from filme_ator
select *from filme
select *from ator

select nome from ator union select nome from ator2
select nome from ator union all select nome from ator2
select a.nome, c cache from ator a cross join ator_cache c

--1	
SELECT A.NOME, F.NOME FROM ATOR A 
INNER JOIN FILME_ATOR FA
ON A.IDATOR=FA.IDATOR
INNER JOIN FILME F

--2
select a.nome, c cache from ator a cross join ator_cache c


--3
SELECT A.NOME, F.NOME FROM ATOR A 
RIGHT JOIN FILME_ATOR FA
ON A.IDATOR=FA.IDATOR
INNER JOIN FILME F
ON FA.IDFILME=F.IDFILME

--4
create table diretor(
	id_diretor serial primary key,
	nome varchar(20),
	data_nascimento date,
)
create table diretor_filme(
	id serial primary key,
	id_filme int,
	id_diretor int,
	constraint fk_diretor foreign key (id_diretor) from diretor(id_diretor)
	constraint fk_filme foreign key (idfilme) from filme(idfilme)
)
	
insert into diretor (nome,data_nascimento) values ('Andre', 2003-02-15),('Leonardo', 2004-09-14),('Henrique', 2001-10-31);
insert into diretor_filme (id_diretor,id_filme) values (1,1),(1,2),(2,3),(2,4),(3,5),(3,6);

--5
create table genero(
	id_genero serial primary key,
	nome varchar(20)
)
create table genero_filme(
	id_genero_filme serial primary key,
	id_genero int,
	idfilme int,
	constraint fk_genero foreign key (id_genero) references genero(id_genero),
	constraint fk_filme foreign key (idfilme) references filme(idfilme)
)
insert into genero (nome) values ('Comédia'),('Aventura'),('Ação'),('Drama'),('Terror'),('Ficção cientifica'),('Romance'),('Animação');

--6
select f.nome as nome_filme, 
       d.nome as nome_diretor, 
       g.nome as genero
from filme f
inner join diretor_filme df on f.idfilme = df.idfilme
inner join diretor d on df.id_diretor = d.id_diretor
inner join genero_filme fg on f.idfilme = fg.idfilme
inner join genero g on fg.id_genero = g.id_genero
order by f.nome, d.nome, g.nome;

--7
create table diretor_cache (
  id serial primary key,
  id_diretor int,
  cache int,
  constraint fk_diretor foreign key (id_diretor) references diretor(id)
)

insert into diretor_cache (id_diretor, cache) values (1, 10000), (2, 8000), (3, 9000);

--8
select f.nome as nome_filme, a.nome as nome_ator from filme f cross join ator a;

--9
select a.nome, c.cache from ator a left join ator_cache c on a.idator = c.idator;

--10
select nome from ator union select nome from ator2;
select nome from ator union all select nome from ator2;