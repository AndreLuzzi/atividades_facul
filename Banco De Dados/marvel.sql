create table hero (
    id_hero serial primary key,
    nome varchar(100),
    universo varchar(50)
);

create table power (
    id_power serial primary key,
    nome_power varchar(100)
);

create table hero_power (
    id_hero int references hero(id_hero),
    id_power int references power(id_power),
    nivel int,
    primary key(id_hero, id_power)
);

create table hq (
    id_hq serial primary key,
    titulo varchar(100),
    ano_publicacao int,
    id_hero int references hero(id_hero)
);

insert into hero (nome, universo) values
('jean grey', 'marvel'),
('jubilee', 'marvel'),
('justiceiro', 'marvel'),
('batman', 'dc'),
('homem-aranha', 'marvel');

-- power
insert into power (nome_power) values
('telepatia'),
('força'),
('velocidade'),
('telecinese');

-- hero_power
insert into hero_power (id_hero, id_power, nivel) values
(1, 1, 95),  -- jean grey, telepatia nível 95
(2, 1, 40),  -- jubilee, telepatia fraca
(3, 2, 80),  -- justiceiro força
(5, 2, 60);  -- homem-aranha força

-- hq (relacionadas ao herói)
insert into hq (titulo, ano_publicacao, id_hero) values
('phoenix resurrection', 2018, 1),
('x-men: red', 2019, 1),
('generation x revival', 2020, 2),
('justiceiro max', 2015, 3),
('teia do aranha', 2021, 5);

select distinct h.nome, q.titulo
from hero h
join hero_power hp on hp.id_hero = h.id_hero
join power p on p.id_power = hp.id_power
join hq q on q.id_hero = h.id_hero
where h.universo = 'marvel'
  and q.ano_publicacao >= 2018
  and p.nome_power = 'telepatia'
  and hp.nivel >= 90
  and h.nome like 'j%';