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
    peso real
)

create table tabelapreco (
    idtabelapreco serial primary key,
    descricao int,
    descontomaximo real,
    codigo int,
    iniciovigencia date,
    fimvigencia date,
    idinativo boolean
)

create table tabelaprecoproduto (
    idtabelaprecoproduto serial primary key,
    idtabelapreco int,
    idproduto int,
    preco real,
    constraint fk_tabelapreco foreign key (idtabelapreco) references tabelapreco(idtabelapreco),
    constraint fk_produto foreign key (idproduto) references produto(idproduto)
)

create table pedido (
    idpedido serial primary key,
    numero int,
    valortotal real,
    quantidadeprodutos real,
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
    valor real,
    quantidade real,
    constraint fk_pedido foreign key (idpedido) references pedido(idpedido),
    constraint fk_produto foreign key (idproduto) references produto(idproduto)
)

insert into pais (nome, sigla) values  ('Brasil', 'BR'),('Argentina', 'AR'),('Estados Unidos', 'US'),('Alemanha', 'DE'),('Japão', 'JP');
insert into estado (nome, sigla, idpais) values('Paraná', 'PR', 1),('São Paulo', 'SP', 1),('Buenos Aires', 'BA', 2),('Califórnia', 'CA', 3),('Baviera', 'BY', 4);
insert into cidade (nome, inscricaoestadual, idestado) values('Cascavel', 123456, 1),('Curitiba', 234567, 1),('São Paulo', 345678, 2),('Los Angeles', 456789, 4),('Munique', 567890, 5);
insert into parceiro (documento, nome, nomefantasia, observacao, idnativo) values(11111111, 'Maria Silva', 'Loja da Maria', 'Cliente frequente', true),(22222222, 'João Souza', 'Mercado do João', 'Cliente chato', true),(33333333, 'Empresa XYZ', 'XYZ Ltda.', 'Fornecedor de eletrônicos', false),(44444444, 'Clínica ABC', 'ABC Saúde', 'Saúde zero', true),(55555555, 'Carlos Lima', 'Auto Peças Lima', 'Revisão pendente', true);
insert into usuario (nome, email, observacao, idnativo) values ('Admin', 'admin@empresa.com', 'Administrador do sistema', true), ('Vendedor 1', 'v1@empresa.com', '', true), ('Vendedor 2', 'v2@empresa.com', '', true), ('Suporte', 'suporte@empresa.com', 'Atendimento ao cliente', false), ('Gerente', 'gerente@empresa.com', '', true);
insert into endereco (logradouro, numero, cep, complemento, idparceiro, idusuario, idcidade, idnativo) values ('Rua A', 100, 85800000, 'Casa', 1, 1, 1, true), ('Rua B', 200, 85801000, 'Apto 2', 2, 2, 2, true), ('Av. Paulista', 1500, 13100000, 'Andar 10', 3, 3, 3, true), ('Rua Califórnia', 789, 90000000, '', 4, 4, 4, false), ('Av. Europa', 321, 80000000, 'Sala 5', 5, 5, 5, true);
insert into telefone (numero, idusuario, idparceiro, idinativo) values (99991111, 1, 1, false), (99992222, 2, 2, false), (99993333, 3, 3, true), (99994444, 4, 4, false), (99995555, 5, 5, false);
insert into condicaopagamento (descricao, codigo, observacao) values('À vista', 1, 'Pagamento no ato'), ('30 dias', 2, 'Pagamento em 30 dias'), ('Parcelado 3x', 3, 'Parcelado em 3 vezes'), ('Boleto 15 dias', 4, ''), ('Cartão crédito', 5, 'Visa/Mastercard');
insert into produto (codigo, descricao, observacao, peso) values (101, 'Notebook', 'Intel i5, 8GB RAM', 2.5), (102, 'Mouse', 'Sem fio', 0.2), (103, 'Teclado', 'Mecânico', 0.8), (104, 'Monitor', '24 polegadas', 3.5), (105, 'HD Externo', '1TB', 0.4);
insert into tabelapreco (descricao, descontomaximo, codigo, iniciovigencia, fimvigencia, idinativo) values (1, 10.0, 1001, '2025-01-01', '2025-12-31', false), (2, 5.0, 1002, '2025-03-01', '2025-12-31', false), (3, 15.0, 1003, '2025-04-01', '2025-10-31', true), (4, 0.0, 1004, '2025-01-01', '2025-06-30', false), (5, 20.0, 1005, '2025-05-01', '2025-11-30', false);
insert into tabelaprecoproduto (idtabelapreco, idproduto, preco) values (1, 1, 3000.00), (1, 2, 80.00), (2, 3, 250.00), (3, 4, 1200.00), (4, 5, 350.00);
insert into pedido (numero, valortotal, quantidadeprodutos, observacao, idtabelapreco, idcondicaopagamento, idparceiro, idusuario, data) values
(1001, 3080.00, 2, '', 1, 1, 1, 1, '2025-05-01'),
(1002, 250.00, 1, 'Urgente', 2, 2, 2, 2, '2025-05-02'),
(1003, 1200.00, 1, '', 3, 3, 3, 3, '2025-05-03'),
(1004, 350.00, 1, '', 4, 4, 4, 4, '2025-05-04'),
(1005, 3080.00, 2, 'Promoção aplicada', 1, 1, 1, 1, '2025-05-05'),
(1006, 250.00, 1, '', 2, 2, 2, 2, '2025-05-06'),
(1007, 1200.00, 1, '', 3, 3, 3, 3, '2025-05-07'),
(1008, 350.00, 1, '', 4, 4, 4, 4, '2025-05-08'),
(1009, 80.00, 1, 'Mouse extra', 1, 1, 1, 1, '2025-05-09'),
(1010, 3000.00, 1, '', 1, 1, 1, 1, '2025-05-10'),
(1011, 350.00, 1, '', 4, 4, 4, 4, '2025-05-11'),
(1012, 1200.00, 1, '', 3, 3, 3, 3, '2025-05-12'),
(1013, 250.00, 1, '', 2, 2, 2, 2, '2025-05-13'),
(1014, 80.00, 1, '', 1, 1, 1, 1, '2025-05-14'),
(1015, 350.00, 1, '', 4, 4, 4, 4, '2025-05-15');
insert into pedidoproduto (idpedido, idproduto, valor, quantidade) values (1, 1, 3000.00, 1), (1, 2, 80.00, 1), (2, 3, 250.00, 1), (3, 4, 1200.00, 1), (4, 5, 350.00, 1);

--1)
select u.nome as nome_usuario, u.email, e.logradouro, e.numero, e.cep, e.complemento, t.numero as telefone from usuario u
left join endereco e on e.idusuario = u.idusuario
left join telefone t on t.idusuario = u.idusuario;

--2)
select p.nomefantasia as nome_fantasia_parceiro,
    c.nome as cidade,
    e.nome as estado,
    e.sigla as sigla_estado,
    pa.nome as pais,
    pa.sigla as sigla_pais
from parceiro p
join endereco en on en.idparceiro = p.idparceiro
join cidade c on c.idcidade = en.idcidade
join estado e on e.idestado = c.idestado
join pais pa on pa.idpais = e.idpais;

--3)
select distinct tp.*
from tabelapreco tp
join tabelaprecoproduto tpp on tpp.idtabelapreco = tp.idtabelapreco
join produto pr on pr.idproduto = tpp.idproduto
join pedidoproduto pp on pp.idproduto = pr.idproduto
join pedido p on p.idpedido = pp.idpedido
where tp.idinativo = false
  and current_date between tp.iniciovigencia and tp.fimvigencia
  and pr.peso > :peso_minimo
  and p.idparceiro = :id_parceiro;