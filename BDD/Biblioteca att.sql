CREATE DATABASE Biblioteca_db;
USE Biblioteca_db;

CREATE TABLE Autores (
    idautor INT AUTO_INCREMENT PRIMARY KEY,
    nomeautor VARCHAR(100) NOT NULL,
    nacionalidade VARCHAR(100) NOT NULL
);
insert into autores (nomeautor, nacionalidade) values
	('daniel','brasileiro'),
    ('davidy', 'venezuelano'),
    ('willian','noruegues'),
    ('arthur','chileno'),
    ('vinicius','japones');
    
CREATE TABLE Livros (
    idlivro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    autor INT NOT NULL,
    anopublicacao INT CHECK (anopublicacao >= 1900),
    quantidade INT DEFAULT 1,
    FOREIGN KEY (autor) REFERENCES Autores(idautor)
    on delete cascade on update cascade
);

insert into Livros (titulo, autor, anopublicacao, quantidade) values
	('harry potter 1','1','1992','3'),
    ('harry potter 2','2','1993','4'),
    ('harry potter 3','3','1994','5'),
    ('harry potter 4','4','1995','6'),
    ('harry potter 5','5','1996','7');


CREATE TABLE Alunos (
    idaluno INT AUTO_INCREMENT PRIMARY KEY,
    nomealuno VARCHAR(100) NOT NULL,
    cpfaluno VARCHAR(14) NOT NULL UNIQUE
);

insert into Alunos (nomealuno, cpfaluno) values
	('daniel','111111'),
    ('davidy','222222'),
    ('willian','333333'),
    ('arthur','444444'),
    ('vinicius','555555');
    
CREATE TABLE Emprestimo (
    idemprestimo INT AUTO_INCREMENT PRIMARY KEY,
    idlivro INT NOT NULL,
    idaluno INT NOT NULL,
    dataemprestimo DATE NOT NULL,
    datadevolucao DATE NOT NULL,
    FOREIGN KEY (idlivro) REFERENCES Livros(idlivro),
    FOREIGN KEY (idaluno) REFERENCES Alunos(idaluno)
    on delete cascade on update cascade
);

insert into Emprestimo (idlivro, idaluno, dataemprestimo, datadevolucao) values
	(1,1,'2001-1-1','2002-1-1'),
    (2,2,'2002-2-2','2003-2-2'),
    (3,3,'2003-3-3','2004-3-3'),
    (4,4,'2004-4-4','2005-4-4'),
    (5,5,'2005-5-5','2006-5-5');

ALTER TABLE Livros
ADD genero VARCHAR(50) NOT NULL;

ALTER TABLE Autores
CHANGE nacionalidade pais_origem VARCHAR(100) NOT NULL;

ALTER TABLE Emprestimo
ADD status VARCHAR(20) DEFAULT 'Emprestado';

update Autores set nomeautor = 'gabriel' where idautor = 1; 
update Livros set titulo = 'harry potter pedra filosofal' where idlivro = 2;

delete from Emprestimo where idaluno = 3;
delete from Alunos where idaluno = 3;
delete from Emprestimo where idemprestimo = 4;


DESCRIBE Autores;
DESCRIBE Livros;
DESCRIBE Alunos;
DESCRIBE Emprestimo;

SHOW DATABASES;
SHOW TABLES;
