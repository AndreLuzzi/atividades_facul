create table Clientes (
    id_cliente serial primary key,
    nome varchar(255) not null,
    email varchar(100),
    data_nasc date,
    data_cadastro date,
    observacao varchar(255),
    tipo_cliente varchar(10) check (tipo_cliente in ('Fisica', 'Juridica'))  -- Adiciona a coluna tipo_cliente
) 	
	
create table Pessoa_fisica (
    id_cliente int primary key,
    id_pessoa_fisica int,
    cpf char(11) unique not null,
    constraint fk_cliente foreign key (id_cliente) references Clientes(id_cliente)
)

create table Pessoa_juridica (
    id_cliente int primary key,
    id_pessoa_juridica int,
    cnpj char(15) unique not null,
    constraint fk_cliente foreign key (id_cliente) references Clientes(id_cliente)
)

create table Telefone (
    id_telefone serial primary key,
    numero varchar(11)
)

create table Clientes_telefone (
    id_cliente int,
    id_telefone int,
    constraint pk_clientes_telefone primary key (id_cliente, id_telefone),
    constraint fk_cliente foreign key (id_cliente) references Clientes(id_cliente),
    constraint fk_telefone foreign key (id_telefone) references Telefone(id_telefone)
)

create table Endereco (
    id_endereco serial primary key,
    cep int not null,
    logradouro varchar(255) not null,
    numero int check (numero > 0) not null,
    cidade varchar(20) not null,
    estado varchar(10) not null,
    pais varchar(30) not null,
    complemento varchar(40),
    bairro varchar(20),
    referencia varchar(255)
)

create table Clientes_endereco (
    id_cliente int,
    id_endereco int,
    constraint pk_clientes_endereco primary key (id_cliente, id_endereco),
    constraint fk_cliente foreign key (id_cliente) references Clientes(id_cliente),
    constraint fk_endereco foreign key (id_endereco) references Endereco(id_endereco)
)

create table Forma_pagamento (
    id_forma_pagamento serial primary key,
    tipo varchar(15)
)

create table Vendedor (
    id_vendedor serial primary key,
    nome varchar(20),
    email varchar(100),
    cpf char(11) unique,
    numero varchar(11)
)

create table Produto (
    id_produto serial primary key,
    descricao varchar(255),
    codigo int unique,
    peso numeric(19, 0) check (peso > 0)
)

create table Pedido (
    id_pedido serial primary key,
    id_cliente int,
    id_endereco int,
    id_forma_pagamento int,
    id_vendedor int,
    numero int unique,
    data_pedido date,
    valor_pedido real check (valor_pedido >= 0),
    valor_desconto real check (valor_desconto <= 50),
    observacao varchar(255) not null,
    prazo_entrega date,
    constraint chk_prazo_entrega check (prazo_entrega <= data_pedido + interval '30 days'),
    constraint fk_cliente foreign key (id_cliente) references Clientes(id_cliente),
    constraint fk_endereco foreign key (id_endereco) references Endereco(id_endereco),
    constraint fk_pagamento foreign key (id_forma_pagamento) references Forma_pagamento(id_forma_pagamento),
    constraint fk_vendedor foreign key (id_vendedor) references Vendedor(id_vendedor)
)

create table Nota_fiscal (
    id_nota serial primary key,
    id_pedido int unique,
    data_emissao date,
    numero_nf int,
    chave_acesso int,
    constraint fk_pedido foreign key (id_pedido) references Pedido(id_pedido)
)

create table Pedido_produto (
    id_pedido int,
    id_produto int,
    quantidade int check (quantidade > 0),
    valor_venda real check (valor_venda > 0),
    constraint pk_pedido_produto primary key (id_pedido, id_produto),
    constraint fk_pedido foreign key (id_pedido) references Pedido(id_pedido),
    constraint fk_produto foreign key (id_produto) references Produto(id_produto)
)

alter table Vendedor rename to Usuario

alter table Pedido add constraint observacao_not_empty check (char_length(observacao) > 0)

alter table Clientes add column profissao varchar(100)

insert into Forma_pagamento (tipo) values ('A vista')
insert into Forma_pagamento (tipo) values ('Debito')
insert into Forma_pagamento (tipo) values ('Credito')

select*from Forma_pagamento

insert into Clientes (id_cliente, nome, email, data_nasc, data_cadastro, observacao, tipo_cliente) values (1, 'Clebin', 'Clebin67@hotmail.com', '22-02-1977', '27-05-2020', 'O Clebin e um cara lega', 'Fisica')
insert into Clientes (id_cliente, nome, email, data_nasc, data_cadastro, observacao, tipo_cliente) values (2, 'Juseudi', 'Juseudi@hotmail.com.br', '17-01-1999', '05-10-2021', 'O Juseudi e um cara chato', 'Fisica')
insert into Clientes (id_cliente, nome, email, data_nasc, data_cadastro, observacao, tipo_cliente) values (3, 'Catatau', 'Catatau@hotmail.com.br', '15-08-1994', '19-04-2020', 'O Catatau tem pendencias', 'Fisica')

select*from Clientes
	
insert into Pessoa_fisica (id_cliente, id_pessoa_fisica, cpf) values (1, 10, 28354160726)
insert into Pessoa_juridica (id_cliente, id_pessoa_juridica, cnpj) values (2, 20, 12967034000139)
insert into Pessoa_juridica (id_cliente, id_pessoa_juridica, cnpj) values (3, 30, 39127564000125)

select*from Pessoa_fisica
select*from Pessoa_juridica
	
insert into Telefone (id_telefone, numero) values (1, 45999193864)
insert into Telefone (id_telefone, numero) values (2, 45999785351)
insert into Telefone (id_telefone, numero) values (3, 45998204084)

select*from Telefone
	
insert into Clientes_telefone (id_cliente, id_telefone) values (1, 1)
insert into Clientes_telefone (id_cliente, id_telefone) values (2, 2)
insert into Clientes_telefone (id_cliente, id_telefone) values (3, 3)

select*from Clientes_telefone
	
insert into Endereco (id_endereco, cep, logradouro, numero, cidade, estado, pais, complemento, bairro, referencia) values (1, 85819040, 'Joao Merlim', 347, 'Cascavel', 'PR', 'Brasil', 'residencial west park', 'Universitario', 'proximo ao lanche da vovo')
insert into Endereco (id_endereco, cep, logradouro, numero, cidade, estado, pais, complemento, bairro, referencia) values (2, 85814283, 'felicidade', 380, 'Cascavel', 'PR', 'Brasil', 'casa verde de madeira', 'Interlagos', 'proximo ao mercado samara')
insert into Endereco (id_endereco, cep, logradouro, numero, cidade, estado, pais, complemento, bairro, referencia) values (3, 85814285, 'Nurburgring', 457, 'Cascavel', 'PR', 'Brasil', 'sobrado do portao rosa', 'Interlagos', 'proximo ao mercado samara')

select*from Endereco
	
insert into Clientes_endereco (id_cliente, id_endereco) values (1, 1)
insert into Clientes_endereco (id_cliente, id_endereco) values (2, 2)
insert into Clientes_endereco (id_cliente, id_endereco) values (3, 3)

select*from Clientes_endereco
	
insert into Usuario (id_vendedor, nome, email, cpf, numero) values (1, 'Josefa', 'Josefa@hotmail.com.br', 91047523680, 45999402855)
insert into Usuario (id_vendedor, nome, email, cpf, numero) values (2, 'Clovis', 'Clovis@gmail.com', 45730926847, 45998999663)
insert into Usuario (id_vendedor, nome, email, cpf, numero) values (3, 'Jusiscleia', 'Jusiscleia@outlook.com', 53420861753, 45999506031)

select*from Usuario
	
insert into Produto (id_produto, descricao, codigo, peso) values (1, 'Do bom', 9935, 90)
insert into Produto (id_produto, descricao, codigo, peso) values (2, 'Do caro', 7912, 33)
insert into Produto (id_produto, descricao, codigo, peso) values (3, 'Do forte', 1488, 96)

select*from Produto
	
insert into Pedido (id_pedido, id_cliente, id_endereco, id_forma_pagamento, id_vendedor, numero, data_pedido, valor_pedido, valor_desconto, observacao, prazo_entrega) values (1, 1, 1, 1, 1, 101, '18-05-2022', 296.77, 25.27, 'Esse vai para entrega', '19-05-2022')
insert into Pedido (id_pedido, id_cliente, id_endereco, id_forma_pagamento, id_vendedor, numero, data_pedido, valor_pedido, valor_desconto, observacao, prazo_entrega) values (2, 2, 2, 2, 2, 102, '30-08-2023', 605.12, 35.8, 'Esse vai pra entrega quando chegar o produto', '22-09-2023')
insert into Pedido (id_pedido, id_cliente, id_endereco, id_forma_pagamento, id_vendedor, numero, data_pedido, valor_pedido, valor_desconto, observacao, prazo_entrega) values (3, 3, 3, 3, 3, 103, '09-01-2024', 590.45, 11.02, 'Vai para entrega', '28-01-2024')

select*from Pedido
	
insert into Nota_fiscal (id_nota, id_pedido, data_emissao, numero_nf, chave_acesso) values (1, 1, '16-11-2022', 101, 001)
insert into Nota_fiscal (id_nota, id_pedido, data_emissao, numero_nf, chave_acesso) values (2, 2, '09-08-2024', 102, 002)
insert into Nota_fiscal (id_nota, id_pedido, data_emissao, numero_nf, chave_acesso) values (3, 3, '21-12-2022', 103, 003)

select*from Nota_fiscal
	
insert into Pedido_produto (id_pedido, id_produto, quantidade, valor_venda) values (1, 1, 4, 479.03)
insert into Pedido_produto (id_pedido, id_produto, quantidade, valor_venda) values (2, 2, 6, 60.08)
insert into Pedido_produto (id_pedido, id_produto, quantidade, valor_venda) values (3, 3, 7, 57.39)

select*from Pedido_produto