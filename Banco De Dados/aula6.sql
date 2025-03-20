create table ator(
	nome varchar(15),
	sobrenome varchar(25)
);

copy ator (nome, sobrenome) from 'C:\Users\luzzi.0912\Desktop\atores.txt' delimiter','