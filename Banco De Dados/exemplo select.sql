create table filme(
	id_filme serial primary key,
	descricao varchar(200),
	titulo varchar(30),
	taxa float,
	obs varchar(200)
)

create table ator(
	id_ator serial primary key,
	nome varchar(30),
	sobrenome varchar(30),
	idade int
)

create table filme_ator(
	id_filme int,
	id_ator int,
	constraint fk_filme foreign key (id_filme) references filme(id_filme),
	constraint fk_ator foreign key (id_ator) references ator(id_ator)
)

insert into ator (nome, sobrenome, idade) values ('Chris', 'Evans', 43),('Robert', 'Downey', 60),('Chris', 'Hemsworth', 41),
('Scarlett', 'Johansson', 40),('Chadwick', 'Boseman', 48),('Tom', 'Holland', 28),('Mark', 'Ruffalo', 57),('Brie', 'Larson', 35),
('Chris', 'Pratt', 45),('Zoe', 'Saldana', 46), ('Samuel', 'L. Jackson', 75), ('Zendaya', 'Coleman', 28),
('Matthew', 'McConaughey', 55), ('Will', 'Smith', 56), ('Ryan', 'Reynolds', 48);

insert into filme (titulo, descricao, taxa) values 
('A Origem', 'Um ladrao entra nos sonhos para roubar segredos', '2000'),
('O Senhor dos Aneis', 'Um hobbit luta para destruir um anel poderoso', '5000'),
('Gladiador', 'Um ex-general busca vinganca contra o imperador corrupto', '1000'),
('Forrest Gump', 'A vida extraordinaria de um homem simples', '600'),
('O Rei Leao', 'Um leao jovem enfrenta desafios para se tornar rei', '1500'),
('Matrix', 'Um hacker descobre que o mundo e uma simulacao', '1200'),
('Titanic', 'Um romance se desenrola durante o desastre do navio', '2000'),
('Jurassic Park', 'Cientistas trazem dinossauros de volta a vida', '1500'),
('Star Wars: Uma Nova Esperanca', 'A luta contra o imperio galactico comeca', '2000'),
('Os Vingadores', 'Super-herois se unem para salvar o mundo', '3000'),
('Cidadao Kane', 'A vida de um magnata e contada apos sua morte', '300'),
('O Poderoso Chefao', 'A historia de uma familia mafiosa', '1000'),
('A Bela e a Fera', 'Uma jovem e uma fera desenvolvem uma conexao', '800'),
('Vingadores: Ultimato', 'O climax da batalha contra Thanos', '5000'),
('Os Increveis', 'Uma familia de super-herois tenta viver discretamente', '1000');

insert into filme_ator (id_filme, id_ator) values (1,1), (2,2), (3,3), (4,4), (5,5),
(6,6), (7,7), (8,8), (9,9), (10,10),
(11,11), (12,12), (13,13), (14,14), (15,15);

select*,(2*taxa) from filme
select*,(2*taxa) from filme where id_filme=5;
select*from filme
select*from filme order by titulo desc
select*from filme where titulo like '%b%';
SELECT id_filme, COUNT(id_ator) FROM filme_ator GROUP BY id_filme;
SELECT id_ator, COUNT(id_filme) FROM filme_ator GROUP BY id_ator;
SELECT * FROM filme_ator LIMIT 10;
SELECT * FROM filme_ator OFFSET 10;



select 4 *5;
select ‘filme query’;
select * from filme_ator;