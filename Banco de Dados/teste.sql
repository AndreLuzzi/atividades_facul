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