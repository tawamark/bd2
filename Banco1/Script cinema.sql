create database cinema;


use cinema;


CREATE TABLE enderecos(
  id_endereco int primary key auto_increment,
  pais varchar(255),
  estado varchar(255),
  cidade varchar(255),
  rua varchar(255),
  numero int,
  cep varchar(255)
);


CREATE TABLE cinemas(
  id_cinema int primary key auto_increment,
  nome_fantasia varchar(255),
  id_endereco int,
  foreign key(id_endereco)
    references enderecos(id_endereco),
  telefone varchar(255),
  email varchar(255),
  num_salas int
);


CREATE TABLE salas(
  id_sala int primary key auto_increment,
  num_sala int,
  id_cinema int,
  foreign key(id_cinema)
    references cinemas(id_cinema),
  num_cadeiras int
);


CREATE TABLE generos(
  id_genero int primary key auto_increment,
  descricao varchar(255)
);


CREATE TABLE filmes(
  id_filme int primary key auto_increment,
  titulo varchar(255),
  duracao time,
  classificacao varchar(3)
);


CREATE TABLE generos_filmes(
  id_genero_filme int primary key auto_increment,
  id_genero int,
  foreign key(id_genero)
    references generos(id_genero),
  id_filme int,
  foreign key(id_filme)
    references filmes(id_filme)
);


CREATE TABLE reviews_filmes(
  id_review int primary key auto_increment,
  id_filme int,
  foreign key(id_filme)
    references filmes(id_filme),
  nota int,
  descricao varchar(255)
);


CREATE TABLE sessoes(
        id_sessao int primary key auto_increment,
    id_sala int,
        foreign key  (id_sala)
                references salas(id_sala),
        data_inicio datetime,
    data_fim datetime,
    id_filme int,
    foreign key (id_filme)
                references filmes(id_filme),
        ativa char(1)
);


CREATE TABLE pessoas(
        id_pessoa int primary key auto_increment,
    nome varchar(255),
        data_nascimento date,
    nacionalidade varchar(255)
);


CREATE TABLE atores_filmes(
        id_ator_filme int primary key auto_increment,
    id_pessoa int,
    foreign key (id_pessoa)
                references pessoas(id_pessoa),
    id_filme int,
    foreign key (id_filme)
                references filmes(id_filme)
);


CREATE TABLE diretores_filmes(
        id_diretor_filme int primary key auto_increment,
    id_pessoa int,
    foreign key (id_pessoa)
                references pessoas(id_pessoa),
    id_filme int,
    foreign key (id_filme)
                references filmes(id_filme)
);


CREATE TABLE tipo_ingresso(
        id_tipo_ingresso int primary key auto_increment,
    descricao varchar(255),
    valor double
);


CREATE TABLE ingressos_vendidos(
        id_ingressos_vendidos int primary key auto_increment,
    id_tipo_ingresso int,
    foreign key (id_tipo_ingresso)
                references tipo_ingresso(id_tipo_ingresso),
    id_sessao int,
    foreign key (id_sessao)
                references sessoes(id_sessao),
        num_poltrona int
);




INSERT INTO enderecos (pais, estado, cidade, rua, numero, cep)
VALUES 
('Brasil', 'SP', 'São Paulo', 'Av. Paulista', 1000, '01310-100'),
('Brasil', 'RJ', 'Rio de Janeiro', 'Rua das Casas', 500, '22240-003');


INSERT INTO cinemas (nome_fantasia, id_endereco, telefone, email, num_salas)
VALUES 
('Cine Paulo', 1, '(11) 99999-0000', 'email@cinepaulo.com', 5),
('Cine Rio', 2, '(21) 88888-0000', 'email@cinerio.com', 4);


INSERT INTO salas (num_sala,id_cinema, num_cadeiras)
VALUES 
(1,1, 100),
(2,1, 80),
(1,2, 90);


INSERT INTO generos (descricao)
VALUES 
('Ação'),
('Comédia'),
('Drama'),
('Terror');


INSERT INTO filmes (titulo, duracao, classificacao)
VALUES 
('Missão Impossível', '02:20:00', '14'),
('Rambo', '01:40:00', '12'),
('Sexta Feira 13', '01:45:00', '16'),
('Senhor dos aneis', '02:45:00', '18'),
('Star Wars', '02:00:00', '12');


INSERT INTO generos_filmes (id_genero, id_filme)
VALUES 
(1, 1),
(2, 2),
(4, 3);


INSERT INTO reviews_filmes (id_filme, nota, descricao)
VALUES 
(1, 9, 'Legal'),
(2, 8, 'Divertido e bem produzido.'),
(3, 7, 'Filme Podre');


INSERT INTO sessoes (id_sala, data_inicio, data_fim, id_filme)
VALUES 
(1, '2025-06-18 20:00:00', '2025-06-18 22:20:00', 1),
(2, '2025-06-18 18:00:00', '2025-06-18 19:40:00', 2),
(3, '2025-06-18 21:00:00', '2025-06-18 22:45:00', 3),
(1, '2025-06-18 15:00:00', '2025-06-18 18:45:00', 4),
(2, '2025-06-18 14:00:00', '2025-06-18 17:00:00', 5),
(2, '2025-06-19 14:00:00', '2025-06-19 17:00:00', 5);


INSERT INTO pessoas (nome, data_nascimento, nacionalidade)
VALUES 
('Cleber', '1962-07-03', 'Americano'),
('Vladimir', '1969-05-01', 'Brasileiro'),
('Joaozinho', '1996-04-16', 'Argentino');


INSERT INTO atores_filmes (id_pessoa, id_filme)
VALUES 
(1, 1),
(3, 3);


INSERT INTO diretores_filmes (id_pessoa, id_filme)
VALUES 
(2, 2),
(1, 1);


INSERT INTO tipo_ingresso (descricao, valor)
VALUES 
('Inteira', 30.00),
('Meia', 15.00);


INSERT INTO ingressos_vendidos (id_tipo_ingresso, id_sessao,num_poltrona)
VALUES 
(1, 1,2),
(2, 2,3),
(1, 3,4);


-- Ingressos adicionais para a sessão 1 (Missão Impossível)
INSERT INTO ingressos_vendidos (id_tipo_ingresso, id_sessao, num_poltrona)
VALUES 
(1, 1, 3),
(2, 1, 4),
(1, 1, 5);


-- Ingressos adicionais para a sessão 2 (Rambo)
INSERT INTO ingressos_vendidos (id_tipo_ingresso, id_sessao, num_poltrona)
VALUES 
(1, 2, 5),
(2, 2, 6),
(1, 2, 7);


-- Ingressos adicionais para a sessão 3 (Sexta Feira 13)
INSERT INTO ingressos_vendidos (id_tipo_ingresso, id_sessao, num_poltrona)
VALUES 
(2, 3, 5),
(1, 3, 6);


-- Ingressos adicionais para a sessão 4 (Senhor dos Aneis)
INSERT INTO ingressos_vendidos (id_tipo_ingresso, id_sessao, num_poltrona)
VALUES 
(1, 4, 2),
(2, 4, 3),
(1, 4, 4);


-- Ingressos adicionais para a sessão 5 (Star Wars)
INSERT INTO ingressos_vendidos (id_tipo_ingresso, id_sessao, num_poltrona)
VALUES 
(1, 5, 2),
(2, 5, 3),
(1, 5, 4);


-- sessoes
select 
        ci.nome_fantasia,
        en.cidade,
        en.rua,
        sa.num_sala,
        fi.titulo,
        se.data_inicio,
        se.data_fim
from sessoes se
        join salas sa on sa.id_sala = se.id_sala
        join cinemas ci on ci.id_cinema = sa.id_cinema
        join enderecos en on en.id_endereco = ci.id_endereco
        join filmes fi on fi.id_filme = se.id_filme;


-- nota media por filme
select
        fi.titulo,
        avg(rf.nota) nota_media
 from reviews_filmes rf
        join filmes fi on fi.id_filme = rf.id_filme
 group by titulo;


-- faturamento por filme 
 select
 fi.titulo,
 count(id_ingressos_vendidos) as ingressos_vendidos,
 sum(valor)
 From filmes fi
        left join sessoes se on se.id_filme = fi.id_filme
        left join ingressos_vendidos iv on iv.id_sessao = se.id_sessao
        join tipo_ingresso ti on ti.id_tipo_ingresso = iv.id_tipo_ingresso
group by fi.titulo, se.id_sessao;


-- quantidade de ingressos por filme
select 
        fi.titulo,
        ti.descricao,
        count(iv.id_tipo_ingresso) as quantidade
from ingressos_vendidos iv 
        join tipo_ingresso ti on ti.id_tipo_ingresso = iv.id_tipo_ingresso
        join sessoes se on se.id_sessao = iv.id_sessao
        join filmes fi on fi.id_filme = se.id_filme
group by se.id_sessao,iv.id_tipo_ingresso
order by titulo;


delimiter $


CREATE VIEW sessoes as
select 
        ci.nome_fantasia,
        en.cidade,
        en.rua,
        sa.num_sala,
        fi.titulo,
        se.data_inicio,
        se.data_fim
from sessoes se
        join salas sa on sa.id_sala = se.id_sala
        join cinemas ci on ci.id_cinema = sa.id_cinema
        join enderecos en on en.id_endereco = ci.id_endereco
        join filmes fi on fi.id_filme = se.id_filme
where ativo = "S"$


delimiter ;


delimiter $


CREATE PROCEDURE ingressos_receitas(IN sessaoId INT)
BEGIN


    SELECT
        iv.id_sessao,
        COUNT(iv.id_ingressos_vendidos) AS total_ingressos_vendidos,
        SUM(ti.valor) AS receita_total
    FROM
        ingressos_vendidos iv
    JOIN
        tipo_ingresso ti ON iv.id_tipo_ingresso = ti.id_tipo_ingresso
    WHERE
        iv.id_sessao = sessaoId
    GROUP BY
        iv.id_sessao;
END $


DELIMITER ;


delimiter $


CREATE PROCEDURE filmes_por_genero(IN generoDescricao VARCHAR(255))
BEGIN
    SELECT
        f.titulo,
        f.duracao,
        f.classificacao,
        g.descricao AS genero
    FROM
        filmes f
    JOIN
        generos_filmes gf ON f.id_filme = gf.id_filme
    JOIN
        generos g ON gf.id_genero = g.id_genero
    WHERE
        g.descricao = generoDescricao;
END //


DELIMITER ;


CALL filmes_por_genero('Ação');