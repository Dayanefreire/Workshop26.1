create table Filme (
ID_Filme INT PRIMARY KEY AUTO_INCREMENT,
Titulo VARCHAR (150) NOT NULL,
Genero VARCHAR (50),
Ano_lancamento INT,
Duracao_minutos INT,
Classificacao VARCHAR (10)
);

Create table Ator (
ID_Ator INT PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR (100) NOT NULL,
Nacionalidade VARCHAR (50),
Data_nascimento DATE,
Sexo VARCHAR (1)
);

INSERT INTO Filme (titulo, genero, ano_lancamento, duracao_minutos, classificacao) VALUES
('O Poderoso Chefão', 'Drama', 1972, 175, '14'),
('Interestelar', 'Ficção Científica', 2014, 169, '10'),
('Parasita', 'Thriller', 2019, 132, '16'),
('Titanic', 'Romance', 1997, 194, '12'),
('Coringa', 'Drama', 2019, 122, '16'),
('Matrix', 'Ficção Científica', 1999, 136, '14'),
('Lion', 'Drama', 2016, 118, '10'),
('Avatar', 'Ficção Científica', 2009, 162, '12'),
('Vingadores', 'Ação', 2019, 181, '12'),
('Coco', 'Animação', 2017, 105, 'L');

INSERT INTO Ator (nome, nacionalidade, data_nascimento, sexo) VALUES
('Marlon Brando', 'Americano', '1924-04-03', 'M'),
('Matthew McConaughey', 'Americano', '1969-11-04', 'M'),
('Song Kang-ho', 'Coreano', '1967-01-17', 'M'),
('Leonardo DiCaprio', 'Americano', '1974-11-11', 'M'),
('Joaquin Phoenix', 'Americano', '1974-10-28', 'M'),
('Keanu Reeves', 'Canadense', '1964-09-02', 'M'),
('Dev Patel', 'Britânico', '1990-04-23', 'M'),
('Zoe Saldana', 'Americana', '1978-06-19', 'F'),
('Robert Downey Jr', 'Americano', '1965-04-04', 'M'),
('Anthony Gonzalez', 'Americano', '2000-08-20', 'M');

UPDATE Filme
SET classificacao = '18'
WHERE ID_Filme = 5;

SELECT * FROM Filme WHERE ano_lancamento > 2000;

SELECT COUNT(*) AS total_filmes FROM Filme;
SELECT AVG(duracao_minutos) AS media_duracao FROM Filme;
SELECT MAX(duracao_minutos) AS filme_mais_longo FROM Filme;

SELECT genero, COUNT(*) AS quantidade FROM Filme GROUP BY genero;
SELECT genero, AVG(duracao_minutos) AS media FROM Filme GROUP BY genero;

CREATE TABLE Elenco (
  id_elenco INT PRIMARY KEY AUTO_INCREMENT,
  id_filme INT,
  id_ator INT,
  personagem VARCHAR(100),
  FOREIGN KEY (id_filme) REFERENCES Filme(id_filme),
  FOREIGN KEY (id_ator) REFERENCES Ator(id_ator)
);

INSERT INTO Elenco (id_filme, id_ator, personagem) VALUES
(1, 1, 'Vito Corleone'),
(2, 2, 'Cooper'),
(3, 3, 'Ki-taek'),
(4, 4, 'Jack'),
(5, 5, 'Arthur Fleck');

SELECT Filme.titulo, Ator.nome, Elenco.personagem
FROM Elenco
INNER JOIN Filme ON Elenco.id_filme = Filme.id_filme
INNER JOIN Ator ON Elenco.id_ator = Ator.id_ator;