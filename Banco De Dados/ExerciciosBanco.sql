CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    cidade VARCHAR(50)
);
CREATE TABLE produtos (
    id_produto SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    preco NUMERIC(10,2),
    estoque INT
);
CREATE TABLE pedidos (
    id_pedido SERIAL PRIMARY KEY,
    id_cliente INT REFERENCES clientes(id_cliente),
    data_pedido DATE DEFAULT CURRENT_DATE
);
CREATE TABLE itens_pedido (
    id_item SERIAL PRIMARY KEY,
    id_pedido INT REFERENCES pedidos(id_pedido),
    id_produto INT REFERENCES produtos(id_produto),
    quantidade INT
);
INSERT INTO clientes (nome, email, cidade) VALUES
('João Silva', 'joao@email.com', 'Curitiba'),
('Maria Oliveira', 'maria@email.com', 'São Paulo'),
('Carlos Pereira', 'carlos@email.com', 'Curitiba'),
('Ana Souza', 'ana@email.com', 'Rio de Janeiro');

INSERT INTO produtos (nome, preco, estoque) VALUES
('Notebook', 3500.00, 10),
('Smartphone', 2000.00, 20),
('Mouse', 50.00, 100),
('Teclado', 120.00, 50);

INSERT INTO pedidos (id_cliente, data_pedido) VALUES
(1, '2025-08-01'),
(2, '2025-08-02');

INSERT INTO itens_pedido (id_pedido, id_produto, quantidade) VALUES
(1, 1, 1),
(1, 3, 2),
(2, 2, 1),
(2, 4, 1);

--1,1:
create function add(int, int) returns int as '
select $1 + $2;
' language sql
immutable
returns null on null input;

select add(5,6)

--1,2:
create or replace function estoque_produto(nome_prod text)
returns int
as $$
    select estoque
    from produtos
    where nome = nome_prod;
$$ language sql;

select estoque_produto('Mouse');

--1,3:
create or replace function preco_com_desconto(nome_prod text, desconto numeric)
returns numeric
as $$
    select round(preco - (preco * (desconto / 100)), 2)
    from produtos
    where nome = nome_prod;
$$ language sql;

select preco_com_desconto('Notebook', 10);

--1,4:
create or replace function total_itens_pedido(id_ped int)
returns int
as $$
    select sum(quantidade)
    from itens_pedido
    where id_pedido = id_ped;
$$ language sql;

select total_itens_pedido(1);

--1,5:
create or replace function busca_cliente_email(email_cli text)
returns text
as $$
    select nome
    from clientes
    where email = email_cli;
$$ language sql;

select busca_cliente_email('maria@email.com');

--2,1:
create or replace function aumenta_estoque(p_id_produto int, p_quantidade int)
returns void as $$
begin
    update produtos
    set estoque = estoque + p_quantidade
    where id_produto = p_id_produto;
end;
$$ language plpgsql;

select aumenta_estoque(1, 5);

--2,2:
create or replace function novo_pedido(p_id_cliente int)
returns int as $$
declare
    v_id_pedido int;
begin
    insert into pedidos (id_cliente, data_pedido)
    values (p_id_cliente, current_date)
    returning id_pedido into v_id_pedido;
    
    return v_id_pedido;
end;
$$ language plpgsql;

select novo_pedido(1);
select * from pedidos;

--2,3:
create or replace function verifica_estoque(nome_produto varchar)
returns varchar as $$
declare
    qtd_estoque int;
begin
    select estoque into qtd_estoque
    from produtos
    where nome = nome_produto;

    if qtd_estoque is null then
        return 'Produto não encontrado';
    elsif qtd_estoque > 0 then
        return 'Disponível';
    else
        return 'Indisponível';
    end if;
end;
$$ language plpgsql;

select verifica_estoque('Notebook');
select verifica_estoque('Mouse');
select verifica_estoque('Teclado');
select verifica_estoque('Smartwatch');

--2,4:
create or replace function aplicar_desconto(p_desconto numeric)
returns void as $$
begin
    update produtos
    set preco = preco * (1 - p_desconto / 100);
end;
$$ language plpgsql;

select aplicar_desconto(10);
select nome, preco from produtos;

--2,5
create table clientes_backup (
    id_cliente serial primary key,
    nome varchar(100),
    email varchar(100),
    cidade varchar(50)
);

create or replace function copia_clientes_cidade(p_cidade varchar)
returns void as $$
begin
    insert into clientes_backup (nome, email, cidade)
    select nome, email, cidade
    from clientes
    where cidade = p_cidade;
end;
$$ language plpgsql;

select copia_clientes_cidade('Curitiba');

select * from clientes_backup;

--3,1:
create or replace function clientes_curitiba()
returns table (
    id_cliente int,
    nome varchar,
    email varchar,
    cidade varchar
) as $$
begin
    return query
    select id_cliente, nome, email, cidade
    from clientes
    where cidade = 'Curitiba';
end;
$$ language plpgsql;

select * from clientes_curitiba();

--3,2:
drop function if exists pedidos_cliente(int);

create function pedidos_cliente(p_id_cliente int)
returns table (
    pedido_id int,
    cliente_id int,
    data_do_pedido date
) as $$
begin
    return query
    select id_pedido, id_cliente, data_pedido
    from pedidos
    where id_cliente = p_id_cliente;
end;
$$ language plpgsql;

select * from pedidos_cliente(1);

--3,3:
create or replace function produtos_sem_estoque()
returns table (
    id_produto int,
    nome varchar,
    preco numeric,
    estoque int
) as $$
begin
    return query
    select p.id_produto, p.nome, p.preco, p.estoque
    from produtos p
    where p.estoque = 0;
end;
$$ language plpgsql;

select * from produtos_sem_estoque();

--3,4:
create or replace function itens_pedido_detalhes(p_id_pedido int)
returns table (
    nome_produto varchar,
    quantidade int,
    valor_total numeric
) as $$
begin
    return query
    select 
        pr.nome,
        ip.quantidade,
        pr.preco * ip.quantidade as valor_total
    from itens_pedido ip
    join produtos pr on pr.id_produto = ip.id_produto
    where ip.id_pedido = p_id_pedido;
end;
$$ language plpgsql;

select * from itens_pedido_detalhes(1);

--3,5:
create or replace function pedidos_periodo(p_data_inicio date, p_data_fim date)
returns table (
    pedido_id int,
    cliente_id int,
    data_do_pedido date
) as $$
begin
    return query
    select id_pedido, id_cliente, data_pedido
    from pedidos
    where data_pedido between p_data_inicio and p_data_fim;
end;
$$ language plpgsql;

select * from pedidos_periodo('2025-08-01', '2025-08-02');

--4,1:
create or replace function deleta_pedido(p_id_pedido int)
returns void as $$
begin
    delete from itens_pedido where id_pedido = p_id_pedido;
    delete from pedidos where id_pedido = p_id_pedido;
end;
$$ language plpgsql;

select deleta_pedido(1);

--4,2:
create or replace function cadastra_cliente(
    p_nome varchar,
    p_email varchar,
    p_cidade varchar
)
returns int as $$
declare
    novo_id int;
begin
    insert into clientes (nome, email, cidade)
    values (p_nome, p_email, p_cidade)
    returning id_cliente into novo_id;

    return novo_id;
end;
$$ language plpgsql;

select cadastra_cliente('Lucas Lima', 'lucas@email.com', 'Porto Alegre');

--4,3:
create or replace function valor_total_pedido(p_id_pedido int)
returns numeric as $$
declare
    total numeric := 0;
begin
    select sum(pr.preco * ip.quantidade)
    into total
    from itens_pedido ip
    join produtos pr on pr.id_produto = ip.id_produto
    where ip.id_pedido = p_id_pedido;

    if total is null then
        return 0;
    else
        return total;
    end if;
end;
$$ language plpgsql;

select valor_total_pedido(1);

--4,5:
create table if not exists produtos_backup (
    id_produto serial primary key,
    nome varchar(100),
    preco numeric(10,2),
    estoque int
);

create or replace function backup_produtos()
returns void as $$
begin
    insert into produtos_backup (nome, preco, estoque)
    select nome, preco, estoque from produtos;
end;
$$ language plpgsql;

create or replace function backup_produtos()
returns void as $$
begin
    insert into produtos_backup (nome, preco, estoque)
    select nome, preco, estoque from produtos;
end;
$$ language plpgsql;

select backup_produtos();