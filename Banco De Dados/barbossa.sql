create table pais (
    idpais serial primary key,
    nome varchar(100),
    sigla varchar(10)
)

create table estado (
    idestado serial primary key,
    nome varchar(100),
    sigla varchar(10),
    idpais int,
    constraint fk_pais foreign key (idpais) references pais(idpais)
)

create table cidade (
    idcidade serial primary key,
    nome varchar(100),
    inscricaoestadual int,
    idestado int,
    constraint fk_estado foreign key (idestado) references estado(idestado)
)

create table parceiro (
    idparceiro serial primary key,
    documento int,
    nome varchar(255),
    nomefantasia varchar(255),
    observacao varchar(255),
    idnativo boolean
)

create table usuario (
    idusuario serial primary key,
    nome varchar(255),
    email varchar(255),
    observacao varchar(255),
    idnativo boolean
)

create table endereco (
    idendereco serial primary key,
    logradouro varchar(255),
    numero int,
    cep int,
    complemento varchar(255),
    idparceiro int,
    idusuario int,
    idcidade int,
    idnativo boolean,
    constraint fk_parceiro foreign key (idparceiro) references parceiro(idparceiro),
    constraint fk_usuario foreign key (idusuario) references usuario(idusuario),
    constraint fk_cidade foreign key (idcidade) references cidade(idcidade)
)

create table telefone (
    idtelefone serial primary key,
    numero int,
    idusuario int,
    idparceiro int,
    idinativo boolean,
    constraint fk_usuario foreign key (idusuario) references usuario(idusuario),
    constraint fk_parceiro foreign key (idparceiro) references parceiro(idparceiro)
)

create table condicaopagamento (
    idcondicaopagamento serial primary key,
    descricao varchar(255),
    codigo int,
    observacao varchar(255)
)

create table produto (
    idproduto serial primary key,
    codigo int,
    descricao varchar(255),
    observacao varchar(255),
    peso double
)

create table tabelapreco (
    idtabelapreco serial primary key,
    descricao int,
    descontomaximo double,
    codigo int,
    iniciovigencia date,
    fimvigencia date,
    idinativo boolean
)

create table tabelaprecoproduto (
    idtabelaprecoproduto serial primary key,
    idtabelapreco int,
    idproduto int,
    preco double,
    constraint fk_tabelapreco foreign key (idtabelapreco) references tabelapreco(idtabelapreco),
    constraint fk_produto foreign key (idproduto) references produto(idproduto)
)

create table pedido (
    idpedido serial primary key,
    numero int,
    valortotal double,
    quantidadeprodutos double,
    observacao varchar(255),
    idtabelapreco int,
    idcondicaopagamento int,
    idparceiro int,
    idusuario int,
    data date,
    constraint fk_tabelapreco foreign key (idtabelapreco) references tabelapreco(idtabelapreco),
    constraint fk_condpag foreign key (idcondicaopagamento) references condicaopagamento(idcondicaopagamento),
    constraint fk_parceiro foreign key (idparceiro) references parceiro(idparceiro),
    constraint fk_usuario foreign key (idusuario) references usuario(idusuario)
)

create table pedidoproduto (
    idpedidoproduto serial primary key,
    idpedido int,
    idproduto int,
    valor double,
    quantidade double,
    constraint fk_pedido foreign key (idpedido) references pedido(idpedido),
    constraint fk_produto foreign key (idproduto) references produto(idproduto)
)

--1
select u.nome as nome_usuario, u.email, e.logradouro, e.numero, e.cep, e.complemento, t.numero as telefone from usuario u
left join endereco e on e.idusuario = u.idusuario
left join telefone t on t.idusuario = u.idusuario;


