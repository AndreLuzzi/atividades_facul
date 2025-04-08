create table Clientes (
    id_cliente serial primary key,
    nome varchar(255) not null,
    email varchar(100),
    data_nasc date,
    data_cadastro date,
    observacao varchar(255)
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
    numero int
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
    complemento varchar(20),
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
    numero int
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
    constraint chk_prazo_entrega check (prazo_entrega <= data_pedido + interval '30 dias'),
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

insert into Clientes (id_cliente, nome, email, data_nasc, data_cadastro, observacao, tipo_cliente) values (1, 'Dra. Isabella Porto', 'alexia67@hotmail.com', '1977-09-22', '2020-05-27', 'Id dignissimos ex expedita adipisci.', 'Física')
insert into Clientes (id_cliente, nome, email, data_nasc, data_cadastro, observacao, tipo_cliente) values (2, 'Bryan Mendes', 'nascimentoluiz-fernando@yahoo.com.br', '1969-01-17', '2021-10-05', 'Optio repellat debitis facere accusamus.', 'Física')
insert into Clientes (id_cliente, nome, email, data_nasc, data_cadastro, observacao, tipo_cliente) values (3, 'Benjamin Ramos', 'qteixeira@ig.com.br', '1994-10-10', '2020-04-19', 'Harum mollitia vel ullam cupiditate ut.', 'Física')
	
insert into Pessoa_fisica (id_cliente, id_pessoa_fisica, cpf) values (1, 10, 28354160726)
insert into Pessoa_juridica (id_cliente, id_pessoa_juridica, cnpj) values (2, 20, 12967034000139)
insert into Pessoa_juridica (id_cliente, id_pessoa_juridica, cnpj) values (3, 30, 39127564000125)
	
insert into Telefone (id_telefone, numero) values (1, 5561919386482)
insert into Telefone (id_telefone, numero) values (2, 5561978535149)
insert into Telefone (id_telefone, numero) values (3, 5531920408402)
	
insert into Clientes_telefone (id_cliente, id_telefone) values (1, 1)
insert into Clientes_telefone (id_cliente, id_telefone) values (2, 2)
insert into Clientes_telefone (id_cliente, id_telefone) values (3, 3)
	
insert into Endereco (id_endereco, cep, logradouro, numero, cidade, estado, pais, complemento, bairro, referencia) values (1, 02973656, 'Viela de da Costa', 347, 'Ferreira', 'RR', 'Brasil', 'ratione', 'Pindura Saia', 'Aut minima quidem minima.')
insert into Endereco (id_endereco, cep, logradouro, numero, cidade, estado, pais, complemento, bairro, referencia) values (2, 99564141, 'Lago Enzo Gabriel Barros', 380, 'Vieira', 'MA', 'Brasil', 'aut', 'Tirol', 'Expedita asperiores.')
insert into Endereco (id_endereco, cep, logradouro, numero, cidade, estado, pais, complemento, bairro, referencia) values (3, 84787334, 'Vale de Rezende', 457, 'Alves', 'PI', 'Brasil', 'impedit', 'Acaba Mundo', 'Similique voluptate ad dolorum.')
	
insert into Clientes_endereco (id_cliente, id_endereco) values (1, 1)
insert into Clientes_endereco (id_cliente, id_endereco) values (2, 2)
insert into Clientes_endereco (id_cliente, id_endereco) values (3, 3)
	
insert into Usuario (id_vendedor, nome, email, cpf, numero) values (1, 'Antônio Silva', 'enzo-gabriel75@uol.com.br', 91047523680, 5571934923103)
insert into Usuario (id_vendedor, nome, email, cpf, numero) values (2, 'Srta. Julia Costa', 'xnovaes@fernandes.br', 45730926847, 5551918941497)
insert into Usuario (id_vendedor, nome, email, cpf, numero) values (3, 'Maria Cecília Peixoto', 'uda-luz@da.com', 53420861753, 5531983032109)
	
insert into Produto (id_produto, descricao, codigo, peso) values (1, 'soluta', 9935, 90)
insert into Produto (id_produto, descricao, codigo, peso) values (2, 'inventore', 7912, 33)
insert into Produto (id_produto, descricao, codigo, peso) values (3, 'dolor', 1488, 96)
	
insert into Pedido (id_pedido, id_cliente, id_endereco, id_forma_pagamento, id_vendedor, numero, data_pedido, valor_pedido, valor_desconto, observacao, prazo_entrega) values (1, 1, 1, 1, 1, 101, '2022-05-18', 296.77, 25.27, 'Cum velit ipsa.', '2022-05-19T00:00:00')
insert into Pedido (id_pedido, id_cliente, id_endereco, id_forma_pagamento, id_vendedor, numero, data_pedido, valor_pedido, valor_desconto, observacao, prazo_entrega) values (2, 2, 2, 2, 2, 102, '2023-08-30', 605.12, 35.8, 'Minima sit fugit rerum rerum nihil.', '2023-09-22T00:00:00')
insert into Pedido (id_pedido, id_cliente, id_endereco, id_forma_pagamento, id_vendedor, numero, data_pedido, valor_pedido, valor_desconto, observacao, prazo_entrega) values (3, 3, 3, 3, 3, 103, '2024-01-09', 590.45, 11.02, 'Impedit alias dolor laudantium aperiam minus.', '2024-01-28T00:00:00')
	
insert into Nota_fiscal (id_nota, id_pedido, data_emissao, numero_nf, chave_acesso) values (1, 1, '2022-11-16', 10001, 4733616459)
insert into Nota_fiscal (id_nota, id_pedido, data_emissao, numero_nf, chave_acesso) values (2, 2, '2024-08-09', 10002, 7110082321)
insert into Nota_fiscal (id_nota, id_pedido, data_emissao, numero_nf, chave_acesso) values (3, 3, '2022-12-21', 10003, 2193448329)
	
insert into Pedido_produto (id_pedido, id_produto, quantidade, valor_venda) values (1, 1, 4, 479.03)
insert into Pedido_produto (id_pedido, id_produto, quantidade, valor_venda) values (2, 2, 6, 60.08)
insert into Pedido_produto (id_pedido, id_produto, quantidade, valor_venda) values (3, 3, 7, 57.39)