select * from idioma

create table idioma (
id_dioma serial primary key,
idioma varchar (30)
);

select * from ator
insert into idioma (idioma) values ('Inglês'), ('Espanhol'), ('Português'), ('Francês'), ('Alemão'), ('Italiano'), ('Chinês'),
('Japonês'), ('Árabe'), ('Russo'), ('Hindi'), ('Coreano'), ('Grego'), ('Holandês'), ('Sueco'), ('Turco'), ('Polonês'), ('Tailandês'),
('Hebraico'), ('Búlgaro'), ('Tcheco'), ('Romeno'), ('Norueguês'), ('Dinamarquês'), ('Finlandês')

create table ator(
id_ator serial primary key,
nome varchar (255),
sobrenome varchar (255),
idade int
);

insert into ator (nome, sobrenome, idade) values ('Chris', 'Evans', 43),('Robert', 'Downey', 60),('Chris', 'Hemsworth', 41),
('Scarlett', 'Johansson', 40),('Chadwick', 'Boseman', 48),('Tom', 'Holland', 28),('Mark', 'Ruffalo', 57),('Brie', 'Larson', 35),
('Chris', 'Pratt', 45),('Zoe', 'Saldana', 46);

select * from ator where nome like '%ton%'

select avg(idade) from ator

select * from ator where idade > 40

select * from ator order by nome desc

select count(id_ator), max(idade), min(idade) from ator

select * from ator where idade between 20 and 30, endereco, filme_ator, ator, categoria, filme