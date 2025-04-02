create table filme(
	id_filme serial primary key,
	descricao varchar(200),
	titulo varchar(30),
	taxa float,
	obs varchar(200)
)

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

select*,(2*taxa) from filme
select*,(2*taxa) from filme where id_filme=5;
select*from filme
select*from filme order by titulo desc
select*from filme where titulo like '%b%';
select 4 *5;
select ‘filme query’;
select * from ATOR;