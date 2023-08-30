create database db_tcc_costurie;

use db_tcc_costurie;

show tables;

show databases;

##TABELA ESTADO
create table tbl_estado(
	id int auto_increment not null primary key,
    nome varchar(255),
    
    unique index(id)
);

##TABELA CIDADE
create table tbl_cidade(
	id int auto_increment not null primary key,
    nome varchar(255),
    id_estado int not null,
    
    constraint FK_Estado_Cidade
    foreign key (id_estado)
    references tbl_estado(id),
    
    unique index(id)
);

##TABELA LOCALIZACAO
create table tbl_localizacao(
	id int auto_increment not null primary key,
    bairro varchar(100) not null,
    id_cidade int not null,
    
    constraint FK_Cidade_Localizacao
    foreign key (id_cidade)
    references tbl_cidade(id),
    
    unique index(id)
);

##TABELA USUARIO
create table tbl_usuario(
	id int auto_increment not null primary key,
    nome varchar(255) not null,
    descricao varchar(255),
    foto varchar(500),
    nome_de_usuario varchar(100) not null,
    email varchar(255) not null,
    senha varchar(515) not null,
    token varchar(10),
    tempo_expiracao time,
    id_localizacao int not null,
    
    constraint FK_Localizacao_Usuario
    foreign key (id_localizacao)
    references tbl_localizacao(id),
    
    unique index(id)
);

##TABELA RECOMENDACAO
create table tbl_recomendacao(
	id int auto_increment not null primary key,
    id_usuario_recomendado int not null,
    id_usuario_recomendador int not null,
    
    constraint FK_UsuarioRecomendado_Recomendacao
    foreign key (id_usuario_recomendado)
    references tbl_usuario(id),
    
    constraint FK_UsuarioRecomendador_Recomendacao
    foreign key (id_usuario_recomendador)
    references tbl_usuario(id),
    
    unique index(id)
);

##TABELA CHAT
create table tbl_chat(
	id_mongo varchar(255) primary key not null
);

##TABELA CONVERSA
create table tbl_conversa(
	id int auto_increment not null primary key,
    id_usuario int not null,
    id_mongo varchar(255),
    
    constraint FK_Usuario_Conversa
    foreign key (id_usuario)
    references tbl_usuario(id),
    
    constraint FK_MongoChat_Conversa
    foreign key (id_mongo)
    references tbl_chat(id_mongo)
);

##TABELA TAG
create table tbl_tag(
	id int auto_increment not null primary key,
    nome varchar(100) not null,
    imagem varchar(500) not null,
    
    unique index(id)
);

##TABELA CATEGORIA
create table tbl_categoria(
	id int auto_increment not null primary key,
    nome varchar(100) not null,
    
    unique index(id)
);

##TABELA CATEGORIA_TAG
create table tbl_categoria_tag(
	id int auto_increment not null primary key,
    id_categoria int not null,
    id_tag int not null,
    
    constraint FK_Categoria_CategoriaTag
    foreign key (id_categoria)
    references tbl_categoria(id),
    
    constraint FK_Tag_CategoriaTag
    foreign key (id_tag)
    references tbl_tag(id)
);

##TABELA TAG_USUARIO
create table tbl_tag_usuario(
	id int auto_increment not null primary key,
    id_tag int not null,
    id_usuario int not null,
    
    constraint FK_Tag_TagUsuario
    foreign key (id_tag)
    references tbl_tag(id),
    
    constraint FK_Usuario_TagUsuario
    foreign key (id_usuario)
    references tbl_usuario(id)
);


















