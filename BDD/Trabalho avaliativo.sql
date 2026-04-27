create database loja_de_jogos;
use loja_de_jogos;

create table jogos (
	id_jogo int auto_increment primary key,
    nome_jogo varchar(150) not null,
    preço float not null,
    id_categoria int auto_increment not null,
    id_plataforma int auto_increment primary key,
    foreign key (id_plataforma) references plataformas(id_plataforma),
    foreign key (id_categoria) references categorias(id_categoria)
    on update cascade on delete cascade
    );
    
create table plataformas (
	id_plataforma int auto_increment primary key,
	nome_plataforma varchar(150) not null
    );
    
create table cliente (
	id_cliente int auto_increment primary key,
    nome_cliente varchar(150) not null,
    email_cliente varchar(150) not null,
    id_pedido int auto_increment primary key,
    foreign key (id_pedido) references pedido(id_pedido)
    on update cascade on delete cascade
    );
    
create table pedidos (
	id_pedido int auto_increment primary key,
    id_cliente int auto_increment primary key,
    id_jogo int auto_increment primary key,
    quantidade int not null,
    foreign key (id_cliente) references cliente(id_cliente),
    foreign key (id_jogo) references jogos(id_jogo)
    );

create table itens_pedidos (
	id_item int auto_increment primary key
    );
    
create table categorias (
	id_categoria int auto_increment primary key,
    nome_categoria varchar(150) not null
    );
    
    
 
 
    
