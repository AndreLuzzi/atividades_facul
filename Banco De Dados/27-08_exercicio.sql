create table endereco(
	idendereco serial primary key,
	logradouro varchar(255),
	numero int,
	cep int,
	complemento varchar(255),
	idparceiro int,
	idusuario int,
	idcidade int,
	idnativo bit
)

create table telefone(
	idtelefone serial primary key,
	numero int,
	idusuario int,
	idparceiro int,
	idnativo bit
)

create table cidade(
	idcidade serial primary key,
	nome varchar(100),
	inscricaoestadual int,
	idestado int
)

create table parceiro(
	idparceiro serial primary key,
	documento int,
	nome varchar(255),
	nomefantasia varchar(255),
	observacao varchar(255),
	idnativo bit
)

create table usuario(
	idusuario serial primary key,
	nome varchar(255),
	email varchar(255),
	observacao varchar(255),
	idnativo bit
)

create table condicaopagamento(
	idcondicaopagamento serial primary key,
	descricao varchar(255),
	codigo int,
	observacao varchar(255)
)

create table estado(
	idestado serial primary key,
	nome varchar(100),
	sigla varchar(10),
	idpais int
)

create table tabelapreco(
	idtabelapreco serial primary key,
	descricao varchar(255),
	descontomaximo double,
	codigo int,
	iniciovigencia date,
	fimvigencia date,
	idnativo bit
)

create table pedido(
	idpedido serial primary key,
	numero int,
	valortotal double,
	quantidadeprodutos double,
	observacao varchar(255),
	idtabelapreco int,
	idcondicaopagamento int,
	idparceiro int,
	idusuario int,
	data timestamp
)

create table pais(
	idpais serial primary key,
	nome varchar(100),
	sigla varchar(10)
)

create table tabelaprecoproduto(
	idtabelapreco int,
	idproduto int,
	preco double,
)

create table produto(
	idproduto serial primary key,
	codigo int,
	descricao varchar(255),
	observacao varchar(255),
	peso double
)

create table pedidoproduto(
	idpedidoproduto serial primary key,
	idpedido int,
	idproduto int,
	valor double,
	quantidade double
)