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
select u.nome, u.email, e.logradouro, e.numero, e.cep, e.complemento, t.numero
from usuario u
left join endereco e on e.idusuario = u.idusuario
left join telefone t on t.idusuario = u.idusuario;

--2)
select p.nomefantasia, c.nome, e.nome, e.sigla, pa.nome, pa.sigla
from parceiro p
inner join endereco en on en.idparceiro = p.idparceiro
inner join cidade c on c.idcidade = en.idcidade
inner join estado e on e.idestado = c.idestado
inner join pais pa on pa.idpais = e.idpais;

--3)
select distinct tp.*
from tabelapreco tp
inner join tabelaprecoproduto tpp on tpp.idtabelapreco = tp.idtabelapreco
inner join produto pr on pr.idproduto = tpp.idproduto
inner join pedidoproduto pp on pp.idproduto = pr.idproduto
inner join pedido p on p.idpedido = pp.idpedido
where tp.idinativo = false
  and current_date between tp.iniciovigencia and tp.fimvigencia
  and pr.peso < 3
  and p.idparceiro = 2;
select*from pedido;
select*from produto;

--4)
select 
    p.idpedido,
    p.data,
    p.valortotal,
    p.quantidadeprodutos,
    par.nome,
    par.nomefantasia,
    u.nome,
    u.email,
    tp.descricao,
    cp.descricao,
    prod.descricao,
    prod.codigo,
    pp.valor,
    pais.nome,
    pais.sigla,
    est.sigla,
    t.numero
from pedido p
inner join parceiro par on p.idparceiro = par.idparceiro
inner join usuario u on p.idusuario = u.idusuario
inner join tabelapreco tp on p.idtabelapreco = tp.idtabelapreco
inner join condicaopagamento cp on p.idcondicaopagamento = cp.idcondicaopagamento
inner join pedidoproduto pp on p.idpedido = pp.idpedido
inner join produto prod on pp.idproduto = prod.idproduto
inner join endereco e on par.idparceiro = e.idparceiro
inner join cidade c on e.idcidade = c.idcidade
inner join estado est on c.idestado = est.idestado
inner join pais pais on est.idpais = pais.idpais
inner join telefone t on par.idparceiro = t.idparceiro;

--5)
create table transportadora (
    id_transportadora serial primary key,
    nome varchar(100) not null,
    cnpj varchar(18) not null unique
);

alter table telefone
add column id_transportadora int,
add constraint fk_telefone_transportadora foreign key (id_transportadora)
references transportadora(id_transportadora);

alter table endereco
add column id_transportadora int,
add constraint fk_endereco_transportadora foreign key (id_transportadora)
references transportadora(id_transportadora)

create table nota_fiscal (
    id_nota_fiscal serial primary key,
    numero_nf varchar(20) not null,
    chave_acesso varchar(50) not null unique,
    data_emissao date not null,
    valor_total decimal(10, 2) not null,
    valor_icms decimal(10, 2),
    base_calculo_icms decimal(10, 2),
    valor_pis decimal(10, 2),
    valor_cofins decimal(10, 2),
    idpedido int not null,
    idparceiro int not null,
    idendereco int not null,
    id_transportadora int not null,
    constraint fkpedido foreign key (idpedido) references pedido(idpedido),
    constraint fkparceiro foreign key (idparceiro) references parceiro(idparceiro),
    constraint fkendereco foreign key (idendereco) references endereco(idendereco),
    constraint fk_transportadora foreign key (id_transportadora) references transportadora(id_transportadora)
)

insert into transportadora (nome, cnpj) values
('transrapido', '12.345.678/0001-01'),
('expresso do sul', '98.765.432/0001-02'),
('nordeste cargas', '11.222.333/0001-03'),
('rodofrete brasil', '22.333.444/0001-04'),
('carga certa', '33.444.555/0001-05')

insert into nota_fiscal (numero_nf, chave_acesso, data_emissao, valor_total, valor_icms, base_calculo_icms,
valor_pis, valor_cofins, idpedido, idparceiro, idendereco, id_transportadora) values
('nf001', '1000000001', '2025-05-01', 1000.00, 180.00, 1000.00, 15.00, 30.00, 1, 1, 1, 1),
('nf002', '1000000002', '2025-05-02', 1500.00, 270.00, 1500.00, 22.50, 45.00, 2, 2, 2, 2),
('nf003', '1000000003', '2025-05-03', 2000.00, 360.00, 2000.00, 30.00, 60.00, 3, 3, 3, 3),
('nf004', '1000000004', '2025-05-04', 2500.00, 450.00, 2500.00, 37.50, 75.00, 4, 4, 4, 4),
('nf005', '1000000005', '2025-05-05', 3000.00, 540.00, 3000.00, 45.00, 90.00, 5, 5, 5, 5),
('nf006', '1000000006', '2025-05-06', 1200.00, 216.00, 1200.00, 18.00, 36.00, 1, 2, 1, 2),
('nf007', '1000000007', '2025-05-07', 1800.00, 324.00, 1800.00, 27.00, 54.00, 2, 3, 2, 3),
('nf008', '1000000008', '2025-05-08', 2200.00, 396.00, 2200.00, 33.00, 66.00, 3, 4, 3, 4),
('nf009', '1000000009', '2025-05-09', 2700.00, 486.00, 2700.00, 40.50, 81.00, 4, 5, 4, 5),
('nf010', '1000000010', '2025-05-10', 3200.00, 576.00, 3200.00, 48.00, 96.00, 5, 1, 5, 1),
('nf011', '1000000011', '2025-05-11', 1100.00, 198.00, 1100.00, 16.50, 33.00, 1, 3, 1, 3),
('nf012', '1000000012', '2025-05-12', 1700.00, 306.00, 1700.00, 25.50, 51.00, 2, 4, 2, 4),
('nf013', '1000000013', '2025-05-13', 2100.00, 378.00, 2100.00, 31.50, 63.00, 3, 5, 3, 5),
('nf014', '1000000014', '2025-05-14', 2600.00, 468.00, 2600.00, 39.00, 78.00, 4, 1, 4, 1),
('nf015', '1000000015', '2025-05-15', 3100.00, 558.00, 3100.00, 46.50, 93.00, 5, 2, 5, 2),
('nf016', '1000000016', '2025-05-16', 1300.00, 234.00, 1300.00, 19.50, 39.00, 1, 4, 1, 4),
('nf017', '1000000017', '2025-05-17', 1900.00, 342.00, 1900.00, 28.50, 57.00, 2, 5, 2, 5),
('nf018', '1000000018', '2025-05-18', 2300.00, 414.00, 2300.00, 34.50, 69.00, 3, 1, 3, 1),
('nf019', '1000000019', '2025-05-19', 2800.00, 504.00, 2800.00, 42.00, 84.00, 4, 2, 4, 2),
('nf020', '1000000020', '2025-05-20', 3300.00, 594.00, 3300.00, 49.50, 99.00, 5, 3, 5, 3),
('nf021', '1000000021', '2025-05-21', 1400.00, 252.00, 1400.00, 21.00, 42.00, 1, 5, 1, 5),
('nf022', '1000000022', '2025-05-22', 1600.00, 288.00, 1600.00, 24.00, 48.00, 2, 1, 2, 1),
('nf023', '1000000023', '2025-05-23', 2400.00, 432.00, 2400.00, 36.00, 72.00, 3, 2, 3, 2),
('nf024', '1000000024', '2025-05-24', 2900.00, 522.00, 2900.00, 43.50, 87.00, 4, 3, 4, 3),
('nf025', '1000000025', '2025-05-25', 3400.00, 612.00, 3400.00, 51.00, 102.00, 5, 4, 5, 4);