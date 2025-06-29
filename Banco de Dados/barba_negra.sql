create table usuario (
    matricula serial primary key,
    nome varchar(100),
    email varchar(100)
)

create table telefone (
    id_telefone serial primary key,
    matricula int,
    ddd varchar(3),
    numero varchar(15),
    constraint fk_usuario foreign key (matricula) references usuario(matricula)
)

create table endereco (
    id_endereco serial primary key,
    matricula int,
    tipo_endereco varchar(10),
    rua varchar(100),
    numero varchar(10),
    bairro varchar(50),
    complemento varchar(50),
    descricao_ilha varchar(100),
    localizacao_gps varchar(50),
    constraint fk_usuario foreign key (matricula) references usuario(matricula)
)

create table sessao (
    codigo_sessao serial primary key,
    descricao varchar(100),
    localizacao varchar(100)
)

create table livro (
    codigo serial primary key,
    titulo varchar(100),
    autor varchar(100),
    codigo_sessao int,
    constraint fk_sessao foreign key (codigo_sessao) references sessao(codigo_sessao)
)

create table emprestimo (
    id_emprestimo serial primary key,
    matricula int,
    hora_emprestimo time,
	data_emprestimo date,
    constraint fk_usuario foreign key (matricula) references usuario(matricula)
)

create table livro_emprestimo (
    id_emprestimo int,
    codigo_livro int,
    constraint pk_livro_emprestimo primary key (id_emprestimo, codigo_livro),
    constraint fk_emprestimo foreign key (id_emprestimo) references emprestimo(id_emprestimo),
    constraint fk_livro foreign key (codigo_livro) references livro(codigo)
)

create table multa (
    id_multa serial primary key,
    id_emprestimo int unique,
    matricula int,
    valor numeric(10,2),
    data_pagamento date,
	hora_pagamento time,
    constraint fk_emprestimo foreign key (id_emprestimo) references emprestimo(id_emprestimo),
    constraint fk_usuario foreign key (matricula) references usuario(matricula)
)

insert into usuario (nome, email) values
('Andre', 'andre@outlook.com'),
('Leonardo', 'leonardo@hotmail.com'),
('Henrique', 'henrique@gmail.com'),
('Alan', 'alan@outlook.com.br')

insert into telefone (matricula, ddd, numero) values
(1, '45', '999998888'),
(2, '45', '988887777'),
(3, '44', '977665544'),
(4, '46', '911223344')

insert into endereco (matricula, tipo_endereco, rua, numero, bairro, complemento) values
(1, 'fixo', 'Rua joao merlin', '1367', 'universitario', 'Apto 308'),
(2, 'fixo', 'Rua galo da serra', '234', 'floresta', 'Casa'),
(4, 'fixo', 'Rua pavao', '12', 'floresta', null)

insert into endereco (matricula, tipo_endereco, rua, numero, bairro, complemento, descricao_ilha, localizacao_gps) values 
(3, 'ilha', null, null, null, null, 'Ilha dos Ventos', '-25.4167,-49.2667')

insert into sessao (descricao, localizacao) values
('Náutica', 'Estante A'),
('Romance', 'Estante B'),
('História Naval', 'Estante C'),
('Clássicos', 'Estante D')

insert into livro (titulo, autor, codigo_sessao) values
('O Mar e o Destino', 'Miguel Costa', 1),
('A Ilha Perdida', 'Maria Lopes', 2),
('História dos Mares', 'Fernando Torres', 3),
('Capitães Literários', 'José Leme', 4)

insert into emprestimo (matricula, hora_emprestimo, data_emprestimo) values
(1, '10:30:00', '2025-06-20'),
(2, '14:15:00', '2025-06-21'),
(3, '09:00:00', '2025-06-22'),
(4, '16:45:00', '2025-06-23')

insert into livro_emprestimo (id_emprestimo, codigo_livro) values
(1, 1),
(1, 2),
(2, 3),
(4, 4)

insert into multa (id_emprestimo, matricula, valor, data_pagamento, hora_pagamento) values
(1, 1, 10.00, '2025-06-25', '11:30:00'),
(2, 2, 5.50, '2025-06-26', '15:00:00'),
(3, 3, 8.75, '2025-06-27', '09:30:00'),
(4, 4, 12.00, '2025-06-28', '17:00:00')

	
alter table emprestimo add column data_devolucao date;

update emprestimo set data_devolucao = current_date where id_emprestimo = 1;

select*from usuario
select*from telefone
select*from endereco
select*from sessao
select*from livro
select*from emprestimo
select*from livro_emprestimo
select*from multa

	
select 
  u.nome,
  u.email,
  t.ddd,
  t.numero as telefone,
  e.rua as logradouro,
  e.numero,
  e.bairro,
  e.complemento,
  e.descricao_ilha,
  e.localizacao_gps as latitude_longitude
from usuario u
left join telefone t on u.matricula = t.matricula
left join endereco e on u.matricula = e.matricula;


select 
  u.nome,
  u.matricula,
  l.titulo,
  l.codigo as tombo,
  s.descricao as sessao,
  s.codigo_sessao,
  u.email,
  case 
    when emp.data_devolucao is null then 'Emprestado'
    else 'Devolvido'
  end as status_emprestimo
from usuario u
inner join emprestimo emp on u.matricula = emp.matricula
inner join livro_emprestimo le on emp.id_emprestimo = le.id_emprestimo
inner join livro l on le.codigo_livro = l.codigo
inner join sessao s on l.codigo_sessao = s.codigo_sessao;


select 
  u.matricula,
  u.nome,
  count(m.id_multa) as qtd_multas,
  sum(m.valor) as valor_total_pago,
  avg(m.valor) as media_valor_pago,
  min(m.valor) as menor_valor_pago,
  max(m.valor) as maior_valor_pago
from usuario u
inner join multa m on u.matricula = m.matricula
group by u.matricula, u.nome
order by valor_total_pago desc;