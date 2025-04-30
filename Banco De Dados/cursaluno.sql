create table cursos(
	cod_curso serial primary key not null,
	tot_cred int not null,
	nom_curso varchar(60) not null,
	cod_coord int not null
)

create table alunos(
	mat_alu serial primary key not null,
	cod_curso int not null,
	dat_nasc date not null,
	tot_cred int not null,
	mgp real not null,
	nom_alu varchar(60) not null,
	email varchar(30),
	constraint fk_cursos foreign key (cod_curso) references cursos (cod_curso)
)
  
create table disciplinas(
	cod_disc serial primary key,
	nome varchar(50),
	cod_curso int,
	constraint fk_cursos foreign key (cod_curso) references cursos (cod_curso)
)

insert into cursos (tot_cred, nom_curso, cod_coord) values
(180, 'Engenharia de Software', 101),
(160, 'Ciência da Computação', 102),
(200, 'Engenharia Elétrica', 103),
(150, 'Matemática Aplicada', 104),
(170, 'Sistemas de Informação', 105);

insert into alunos (cod_curso, dat_nasc, tot_cred, mgp, nom_alu, email) values
(1, '2000-05-12', 120, 8.5, 'Ana Clara Silva', 'ana.silva@example.com'),
(1, '1999-09-23', 140, 7.9, 'Bruno Souza', 'bruno.souza@example.com'),
(1, '2001-01-15', 100, 9.2, 'Camila Ramos', 'camila.ramos@example.com'),
(2, '2002-03-22', 110, 7.0, 'Diego Martins', 'diego.martins@example.com'),
(2, '2000-07-19', 130, 6.8, 'Eduarda Lima', 'eduarda.lima@example.com'),
(2, '1998-11-30', 150, 8.1, 'Felipe Gonçalves', 'felipe.goncalves@example.com'),
(3, '2001-06-14', 100, 9.0, 'Gabriela Rocha', 'gabriela.rocha@example.com'),
(3, '2000-12-02', 115, 7.6, 'Henrique Souza', 'henrique.souza@example.com'),
(3, '1999-08-25', 130, 8.3, 'Isabela Tavares', 'isabela.tavares@example.com'),
(4, '2003-02-11', 90, 7.2, 'João Pedro Alves', 'joao.alves@example.com'),
(4, '2002-04-17', 100, 6.5, 'Karla Mendes', 'karla.mendes@example.com'),
(4, '2001-10-09', 120, 8.0, 'Lucas Pereira', 'lucas.pereira@example.com'),
(5, '2000-03-01', 110, 9.1, 'Marina Costa', 'marina.costa@example.com'),
(5, '1999-05-27', 130, 8.7, 'Nicolas Rocha', 'nicolas.rocha@example.com'),
(5, '2002-12-05', 100, 7.4, 'Olívia Castro', 'olivia.castro@example.com');

insert into disciplinas (nome, cod_curso) values ('matematica', 1), ('fisica', 3), ('empreendedorismo', 2), ('startup', null);
select*from disciplinas
select*from cursos
select*from alunos
select distinct nom_curso,(select min(dat_nasc) from alunos where alunos.cod_curso = cursos.cod_curso) as aluno_mais_velho from cursos