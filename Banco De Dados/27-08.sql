create table alunos(
	id_aluno serial primary key,
	nom_alu varchar(50)
)

insert into alunos (nom_alu) values ('andre'),('leonardo'),('henrique'),('leticia'),('alan');

CREATE OR REPLACE VIEW alunos_view
AS 
SELECT nom_alu
FROM alunos
ORDER BY nom_alu asc;

select*from alunos_view
select*from alunos_view where nom_alu like 'a%';

