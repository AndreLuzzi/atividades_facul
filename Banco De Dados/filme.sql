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
