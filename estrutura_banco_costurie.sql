drop database if exists db_tcc_costurie;

create database db_tcc_costurie;

use db_tcc_costurie;

 

show databases;


##TABELA LOCALIZACAO
create table tbl_localizacao(
	id int auto_increment not null primary key,
    bairro varchar(255) not null,
    cidade varchar(255) not null,
    estado varchar(255) not null,
    
    unique index(id)
);

##TABELA USUARIO
create table tbl_usuario(
	id int auto_increment not null primary key,
    nome varchar(255) default '' not null,
    descricao varchar(255) default '' not null,
    foto text,
    nome_de_usuario varchar(100) not null,
    email varchar(255) not null,
    senha varchar(515) not null,
    token varchar(10),
    tempo_expiracao time,
    id_localizacao int,
    
    constraint FK_Localizacao_Usuario
    foreign key (id_localizacao)
    references tbl_localizacao(id),
    
    unique index(id)
);
    

##TABELA REDE SOCIAL
create table tbl_rede_social(
	id int auto_increment not null primary key,
    link text,
    id_usuario int not null,
    
    constraint FK_Usuario_RedeSocial
    foreign key (id_usuario)
    references tbl_usuario(id),
    
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
    references tbl_chat(id_mongo),
    
    unique index(id)
);

##TABELA CATEGORIA
create table tbl_categoria(
	id int auto_increment not null primary key,
    nome varchar(100) not null,
    
    unique index(id)
);

##TABELA TAG
create table tbl_tag(
	id int auto_increment not null primary key,
    nome varchar(100) not null,
    imagem text not null,
    id_categoria int not null,
    
    constraint FK_Categoria_Tag
    foreign key (id_categoria)
    references tbl_categoria(id),
    
    unique index(id)
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
    references tbl_usuario(id),
    
    unique index(id)
);

##TABELA PUBLICACAO
create table tbl_publicacao(
	id int auto_increment not null primary key,
    titulo varchar(45) not null,
    descricao text not null,
    anexo text not null,
    data_publicacao date not null,
    hora time not null, 
    id_usuario int not null,
    
    constraint FK_Usuario_Publicacao
    foreign key (id_usuario)
    references tbl_usuario(id),
    
    unique index(id)
);

##TABELA TAG_PUBLICACAO
create table tbl_tag_publicacao(
	id int auto_increment not null primary key,
    id_tag int not null,
    id_publicacao int not null,
    
    constraint FK_Tag_TagPublicacao
    foreign key (id_tag)
    references tbl_tag(id),
    
    constraint FK_Publicacao_TagPublicacao
    foreign key (id_publicacao)
    references tbl_publicacao(id),
    
    unique index(id)
);

##TABELA AVALIACAO
create table tbl_avaliacao(
	id int auto_increment not null primary key,
    quantidade bit,
    id_tag_publicacao int not null,
    
    constraint FK_TagPublicao_Avaliacao
    foreign key (id_tag_publicacao)
    references tbl_tag_publicacao(id),
    
    unique index(id)
);

##TABELA COMENTARIO
create table tbl_comentario(
	id int auto_increment not null primary key,
    data_comentario date not null,
    hora_comentario time not null,
    mensagem varchar(500) not null,
    id_publicacao int not null,
    id_usuario int not null,
    
    constraint FK_Publicacao_Comentario
    foreign key (id_publicacao)
    references tbl_publicacao(id),
    
    constraint FK_Usuario_Comentario
    foreign key (id_usuario)
    references tbl_usuario(id),
    
    unique index(id)
);

##TABELA RESPOSTA_COMENTARIO
create table tbl_resposta_comentario(
	id int auto_increment not null primary key,
    data_resposta date not null,
    hora_resposta time not null,
    mensagem varchar(255) not null,
    id_comentario int not null,
    id_usuario int not null,
    
    constraint FK_Comentario_RespostaComentario
    foreign key (id_comentario)
    references tbl_comentario(id),
    
    constraint FK_Usuario_RespostaComentario
    foreign key (id_usuario)
    references tbl_usuario(id),
    
    unique index(id)
);

##TABELA DENUNCIA
create table tbl_denuncia(
	id int auto_increment not null primary key,
    mensagem varchar(500) not null,
    id_publicacao int,
    id_usuario int,
    
	constraint FK_Publicacao_Denuncia
    foreign key (id_publicacao)
    references tbl_publicacao(id),
    
    constraint FK_Usuario_Denuncia
    foreign key (id_usuario)
    references tbl_usuario(id),
    
    unique index(id)
);

##TABELA TIPO_DENUNCIA
create table tbl_tipo_denuncia(
	id int auto_increment not null primary key,
    tipo varchar(45) not null,
    
    unique index(id)
);

##TABELA DENUNCIA_TIPO_DENUNCIA
create table tbl_denuncia_tipo_denuncia(
	id int auto_increment not null primary key,
    id_denuncia int not null,
    id_tipo_denuncia int not null,
    
    constraint FK_Denuncia_DenunciaTipoDenuncia
    foreign key (id_denuncia)
    references tbl_denuncia(id),
    
    constraint FK_TipoDenuncia_DenunciaTipoDenuncia
    foreign key (id_tipo_denuncia)
    references tbl_tipo_denuncia(id),

	unique index(id)
);
