create table curso(
	id_curso serial primary key,
	nome varchar(100),
	descricao varchar(100),
	carga_horaria time
)
select*from curso