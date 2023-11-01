create database db_costurie_tcc_teste;

use db_costurie_tcc_teste;


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






insert into tbl_localizacao(bairro, cidade, estado) values ('Acrinho', 'Acrelandia', 'AC');
insert into tbl_localizacao(bairro, cidade, estado) values ('Engenho Novo', 'Barueri', 'SP');
insert into tbl_localizacao(bairro, cidade, estado) values ('Paulista', 'São Paulo', 'SP');
insert into tbl_localizacao(bairro, cidade, estado) values ('Niteroi', 'Rio', 'RJ');

#INSERT
insert into tbl_usuario(nome_de_usuario, email, senha) values ('mumuzin15', 'mumuzi@gmail.com', '12345678');
insert into tbl_usuario(nome_de_usuario, email, senha) values ('andrezito', 'andredograu@gmail.com', '123456789');

#USUARIOS COMPLETOS
insert into tbl_usuario(nome, descricao, foto, nome_de_usuario, email, senha, id_localizacao) values ('André', 'Trabalho fazendo roupas com o tema de moda infantil', 'url','andrezito', 'andredograu@gmail.com', '123456789', 1);
insert into tbl_usuario(nome, descricao, foto, nome_de_usuario, email, senha, id_localizacao) values ('Luiz', 'Trabalho fazendo tricô', 'url', 'lulis', 'luiz@gmail.com', 'luiz123', 2);
insert into tbl_usuario(nome, descricao, foto, nome_de_usuario, email, senha, id_localizacao) values ('Tiago', 'Trabalho com tapetes personalizados para festa', 'url', 'tigas', 'tiago@gmail.com', 'tiago123', 3);

#INSERT 
insert into tbl_categoria(nome) values ('Vestuário');
insert into tbl_categoria(nome) values ('Acessórios');
insert into tbl_categoria(nome) values ('Ajustes e Reparos');
insert into tbl_categoria(nome) values ('Decoração');
insert into tbl_categoria(nome) values ('Artesanato');
insert into tbl_categoria(nome) values ('Pets');
insert into tbl_categoria(nome) values ('Geral');

#INSERTS
	## VESTUARIO ##
insert into tbl_tag(
						nome, 
                        imagem, 
                        id_categoria
                        ) values (
                        'Casual',
						'https://img.freepik.com/free-photo/male-belt-sweater-accessories-clothes_1203-6421.jpg?w=740&t=st=1694351721~exp=1694352321~hmac=cebea3dc3c1f0bbb3b224d66947feddf4550fee45b41f3bfb7e9142ba1a5bc71',
                        1);
                        
insert into tbl_tag(
						nome, 
                        imagem, 
                        id_categoria
                        ) values (
                        'Trabalho',
						'https://img.freepik.com/free-photo/men-clothes-accessories_23-2147689458.jpg?w=740&t=st=1694351641~exp=1694352241~hmac=fbc9562085a9027a19a8fee0cf0607e28961c1efc101c200d5838975106910d0',
                        1);
                        
insert into tbl_tag(
						nome, 
                        imagem, 
                        id_categoria
                        ) values (
                        'Formal',
						'https://img.freepik.com/free-photo/amazing-cute-couple-love-celebrating-great-party-tinsels-making-selfie-luxury-evening-clothes-brightful-positive-emotions_197531-2547.jpg?w=740&t=st=1694351894~exp=1694352494~hmac=28cfcd48356b2c231d13969cd6d78ccf1b1704059571b2984c33a665a5584968',
                        1);
                        
insert into tbl_tag(
						nome, 
                        imagem, 
                        id_categoria
                        ) values (
                        'Festa',
						'https://img.freepik.com/free-photo/high-angle-young-woman-with-mask-carnival-party_23-2148412828.jpg?w=360&t=st=1694351795~exp=1694352395~hmac=efc235c50b32f461048cf1dc0c9e41e134fd78f4b0912f55b8ff91ac362cb8be',
                        1);
                        
insert into tbl_tag(
						nome, 
                        imagem, 
                        id_categoria
                        ) values (
                        'Esportiva',
						'https://img.freepik.com/free-photo/laughing-sport-partners-urban-background_23-2147758023.jpg?w=740&t=st=1694352000~exp=1694352600~hmac=5f6953ffab0f7eec03fc3aa107b8a754d81c1fd69ec05a1e99759469adeea713',
                        1);

insert into tbl_tag(
						nome, 
                        imagem, 
                        id_categoria
                        ) values (
                        'Lingirie',
						'https://img.freepik.com/free-photo/female-lingerie-arrangement-still-life_23-2150411287.jpg?w=360&t=st=1694352038~exp=1694352638~hmac=11698d6c07c4c4ec52fd4de578d2a1c429f5ea2072c7850f1c83565d6ad3379f',
                        1);
                        
insert into tbl_tag(
						nome, 
                        imagem, 
                        id_categoria
                        ) values (
                        'Praia',
						'https://img.freepik.com/free-photo/travel-accessories-with-coconut_23-2148100605.jpg?w=740&t=st=1694352044~exp=1694352644~hmac=e499938301f53f93e37212544f3131d8a1abfa99d98edc2c0804339c26d37bc5',
                        1);
                        
insert into tbl_tag(
						nome, 
                        imagem, 
                        id_categoria
                        ) values (
                        'Inverno',
						'https://img.freepik.com/free-photo/knitted-blankets-close-up_23-2148832362.jpg?w=740&t=st=1694352110~exp=1694352710~hmac=c677b10ce67562f68b62d0f9ae7b4a6dd30630be845d1268c3bcfa8ddf1aefce',
                        1);
                        
insert into tbl_tag(
						nome, 
                        imagem, 
                        id_categoria
                        ) values (
                        'Verão',
						'https://img.freepik.com/free-photo/view-hawaiian-shirt-with-garland-smartwatch_23-2149366026.jpg?w=740&t=st=1694352112~exp=1694352712~hmac=b51f7d63f3dac47e39f021a418b22a19f5b5649735af1ee3e476cf9d000eb847',
                        1);
				
insert into tbl_tag(
						nome, 
                        imagem, 
                        id_categoria
                        ) values (
                        'Maternidade',
						'https://img.freepik.com/free-photo/front-view-couple-gender-reveal-party_23-2150256583.jpg?w=740&t=st=1694352171~exp=1694352771~hmac=8f81099e144d482cfe47070131a7640428e760e7b491f53288b303265a90141e',
                        1);
                        
insert into tbl_tag(
						nome, 
                        imagem, 
                        id_categoria
                        ) values (
                        'Bebê e Crianças',
						'https://img.freepik.com/free-photo/flat-lay-baby-clothes-with-photo-camera_23-2148251466.jpg?w=740&t=st=1694352180~exp=1694352780~hmac=e65a3ac99bfccc811a32c6c43341e588bc7adcce8a292a8cf61e77cb7222122b',
                        1);
                        
insert into tbl_tag(
						nome, 
                        imagem, 
                        id_categoria
                        ) values (
                        'Dormir',
						'https://img.freepik.com/free-photo/messy-bedroom-with-clothes-bed_23-2149363748.jpg?w=740&t=st=1694352248~exp=1694352848~hmac=97f46b7059dad3033e8e9e37fdae5f4dedce6593ddf8f9f102150509432c2ee8',
                        1);
                        
insert into tbl_tag(
						nome, 
                        imagem, 
                        id_categoria
                        ) values (
                        'Dança',
						'https://img.freepik.com/free-photo/crop-couple-ballroom-costumes_23-2147711637.jpg?w=740&t=st=1694352251~exp=1694352851~hmac=8dbb26a1ddb885effe3e8c0fd56e26e36480ca35aa2b11764f054667c0a7ff8a',
                        1);

insert into tbl_tag(
						nome, 
                        imagem, 
                        id_categoria
                        ) values (
                        'Étnica',
						'https://img.freepik.com/free-photo/woman-wearing-traditional-ukrainian-vyshyvanka_1303-31404.jpg?w=740&t=st=1694352325~exp=1694352925~hmac=522ccb9f9c917aea87a86d2ba9044aee189622032f1dfb2cbf7b23aa7aae0db4',
                        1);
                        
insert into tbl_tag(
						nome, 
                        imagem, 
                        id_categoria
                        ) values (
                        'Tamanho Grande (Plus Size)',
						'https://img.freepik.com/free-photo/full-shot-professional-plus-size-dancer-training_23-2150588887.jpg?w=360&t=st=1694352327~exp=1694352927~hmac=4f5d51c4342170fa0029fb717e85605177e32e1591fe3fda8fe2f71674d15c99',
                        1);
                        
insert into tbl_tag(
						nome, 
                        imagem, 
                        id_categoria
                        ) values (
                        'Esqui e Snowboard',
						'https://img.freepik.com/free-photo/group-friends-looking-mountains-view_329181-5301.jpg?w=740&t=st=1694352465~exp=1694353065~hmac=df3e7a86a0ca1f5911050c93c62040e037156354631dbd22e469c09dd1d59d0c',
                        1);
                        
insert into tbl_tag(
						nome, 
                        imagem, 
                        id_categoria
                        ) values (
                        'Mergulho',
						'https://img.freepik.com/free-photo/medium-shot-man-sitting-surfboard_23-2148926826.jpg?w=360&t=st=1694352476~exp=1694353076~hmac=79b7a291fe637d33627199cc9174c7710ca6c79a8bc435a8f76b8a3283d8e483',
                        1);
                        
insert into tbl_tag(
						nome, 
                        imagem, 
                        id_categoria
                        ) values (
                        'Uniformes',
						'https://img.freepik.com/free-photo/male-tailor-s-hand-sewing-fabric-with-needle_23-2148180324.jpg?w=740&t=st=1694352543~exp=1694353143~hmac=e6b8f939ddd1ea08643a5a42e1857cfc4864fe6bf3f96cc157ce882dd05e67d0',
                        1);
                        
insert into tbl_tag(
						nome, 
                        imagem, 
                        id_categoria
                        ) values (
                        'Fantasias',
						'https://img.freepik.com/free-photo/little-children-trick-treating-halloween_53876-49155.jpg?w=740&t=st=1694352548~exp=1694353148~hmac=15414f91220cd460bc9f946cf3deb799ba1b98014fdc46cc67eee64f123adf9b',
                        1);

insert into tbl_tag(
						nome, 
                        imagem, 
                        id_categoria
                        ) values (
                        'Couro',
						'https://img.freepik.com/free-photo/male-designer-leather-tailor-working-factory-close-up_1303-26309.jpg?w=740&t=st=1694352587~exp=1694353187~hmac=e64c0b4e7231d54b4bca29c5bb74c3aa88e23e53a0cfcbacdd50970625e18499',
                        1);

#INSERTS
	## ACESSORIOS DE MODA ##
insert into tbl_tag(
						nome, 
                        imagem, 
                        id_categoria
                        ) values (
                        'Bolsa',
						'https://img.freepik.com/free-photo/front-view-woman-holding-purses_52683-94830.jpg?w=360&t=st=1694352736~exp=1694353336~hmac=a2f12e6a04f1f08f639da864688cd29853c8a8df9cf3206f44f8633f6d18b40e',
                        2);
                        
insert into tbl_tag(
						nome, 
                        imagem, 
                        id_categoria
                        ) values (
                        'Cintos',
						'https://img.freepik.com/free-photo/bridegrooom-tie-belt_627829-11857.jpg?w=740&t=st=1694352896~exp=1694353496~hmac=9433d3caa4266a30a320df98cafc2917ca9d4bca7a5b0e29667bf555bf245f54',
                        2);
		
insert into tbl_tag(
						nome, 
                        imagem, 
                        id_categoria
                        ) values (
                        'Chapéu',
						'https://img.freepik.com/free-photo/closeup-shot-fancy-cowboy-hat-with-orange-flower-it-worn-by-elderly-person_181624-25239.jpg?w=740&t=st=1694352915~exp=1694353515~hmac=e37c48a55a9f6e0c75b9a44e77fdac061315ebdea298dd48e0dc70b2b164d185',
                        2);
                        
insert into tbl_tag(
						nome, 
                        imagem, 
                        id_categoria
                        ) values (
                        'Luva',
						'https://img.freepik.com/free-photo/young-woman-working-out-street_23-2148213167.jpg?w=740&t=st=1694352953~exp=1694353553~hmac=fdaa8746c28eceb1a17a39731b420263629b08c9b9c812f654099673fa63db7d',
                        2);
                        
insert into tbl_tag(
						nome, 
                        imagem, 
                        id_categoria
                        ) values (
                        'Meias',
						'https://img.freepik.com/free-photo/closeup-sportswoman-wearing-white-socks-while-preparing-workout-home_637285-2992.jpg?w=740&t=st=1694352971~exp=1694353571~hmac=fa3f76647148373813a66266f91661ee4084664705302a29add38db48fa440aa',
                        2);
                        
insert into tbl_tag(
						nome, 
                        imagem, 
                        id_categoria
                        ) values (
                        'Gravata',
						'https://img.freepik.com/free-photo/tie-concept-fathers-day_23-2148107539.jpg?w=740&t=st=1694352997~exp=1694353597~hmac=8705313c5e2071ca9e8ef7fee2397ea4185a79d3ef23d7290ef5cead3fa43117',
                        2);
                        
insert into tbl_tag(
						nome, 
                        imagem, 
                        id_categoria
                        ) values (
                        'Acessórios de Cabelo',
						'https://img.freepik.com/free-photo/back-view-girl-dress-with-bow-her-hair-gray-background_169016-15116.jpg?w=740&t=st=1694353020~exp=1694353620~hmac=7a629de1510f9e6a096a19f2373da179b2d6a7cfdf06d666a76d93a00989b022',
                        2);
                        
#INSERTS
	## AJUSTES E REPAROS ##
insert into tbl_tag(
						nome, 
                        imagem, 
                        id_categoria
                        ) values (
                        'Botões',
						'https://img.freepik.com/free-photo/full-frame-view-many-colorful-buttons_23-2147875077.jpg?w=740&t=st=1694353142~exp=1694353742~hmac=be3f3b701e4fce0e47a3bee016466d77b02c941532758a81936a6a60538f76d2',
                        3);
                        
insert into tbl_tag(
						nome, 
                        imagem, 
                        id_categoria
                        ) values (
                        'Zíper',
						'https://img.freepik.com/free-photo/high-angle-zippers-with-thimble_23-2148527950.jpg?w=740&t=st=1694353173~exp=1694353773~hmac=f8e379c9ec1a987dbb9494941183706a32c8cef54730a2490148059c8b70deca',
                        3);
                        
insert into tbl_tag(
						nome, 
                        imagem, 
                        id_categoria
                        ) values (
                        'Bainha',
						'https://img.freepik.com/free-photo/blue-jeans-fabric-details_150588-44.jpg?w=740&t=st=1694353200~exp=1694353800~hmac=a779c550f1d247f3fd53db9220b8766246066a29c99406feee70fd53975ccd56',
                        3);
                        
insert into tbl_tag(
						nome, 
                        imagem, 
                        id_categoria
                        ) values (
                        'Cintura',
						'https://img.freepik.com/free-photo/beautiful-fashion-woman-posing-with-elegant-suit_1328-3285.jpg?w=740&t=st=1694353238~exp=1694353838~hmac=f4f9eef4db63ef0ce2193eb5e990cb52d106c619d942751701ef0eb1cb4c87c4',
                        3);
                        
insert into tbl_tag(
						nome, 
                        imagem, 
                        id_categoria
                        ) values (
                        'Manga',
						'https://img.freepik.com/free-photo/lace-white-wedding-dress-coat-hanger-against-wooden-textured-background_23-2147936697.jpg?w=740&t=st=1694353240~exp=1694353840~hmac=7fc999b2a301c53df5128ce8fbddaa8ded495a26460fd4b6de45af56823daefe',
                        3);
                        
insert into tbl_tag(
						nome, 
                        imagem, 
                        id_categoria
                        ) values (
                        'Apertar ou Alargar',
						'https://img.freepik.com/free-photo/woman-sewing-manual-skirt_23-2148898078.jpg?w=740&t=st=1694353285~exp=1694353885~hmac=730c91ceddacb594bba2730999c3e7006aa1d9238655c9908c51c6873ba5c9de',
                        3);
                        
insert into tbl_tag(
						nome, 
                        imagem, 
                        id_categoria
                        ) values (
                        'Ragos',
						'https://img.freepik.com/free-photo/woman-doing-jeans-patchwork-using-sewing-machine-home-diy-sewing-concept_1150-6480.jpg?w=740&t=st=1694353289~exp=1694353889~hmac=4df09326e6234054a41d3969a1466c768e6adefad176a36dc4630f5274515904',
                        3);
                        
insert into tbl_tag(
						nome, 
                        imagem, 
                        id_categoria
                        ) values (
                        'Decote',
						'https://img.freepik.com/free-photo/lady-working-as-fashion-designer-creating-new-dress_197531-24020.jpg?w=740&t=st=1694353370~exp=1694353970~hmac=391d1e1c1553c4cdd69f598b858427c43a84d96bc86f563fd8f0dec076b801f4',
                        3);
					
insert into tbl_tag(
						nome, 
                        imagem, 
                        id_categoria
                        ) values (
                        'Reforma',
						'https://img.freepik.com/free-photo/cropped-image-tailor-makes-measurements-jeans-with-meter-sewing-workshop_613910-4431.jpg?w=740&t=st=1694353372~exp=1694353972~hmac=4f1a0ca49f9872801a3e17d69cacd432863fdb6a3e73c5320a7595e6b53046cb',
                        3);
                        
#INSERTS
	## DECORAÇÃO ##
insert into tbl_tag(
						nome, 
                        imagem, 
                        id_categoria
                        ) values (
                        'Almofada',
						'https://img.freepik.com/free-photo/sofa-pillow-decoration-interior-living-room_74190-1912.jpg?w=740&t=st=1694353518~exp=1694354118~hmac=d4448def6df4400b1d3ea7c26fe4dee826d3d68ab7c68d1425679bda004bbc10',
                        4);
                        
insert into tbl_tag(
						nome, 
                        imagem, 
                        id_categoria
                        ) values (
                        'Cortinas',
						'https://img.freepik.com/free-photo/curtain-with-sunlight_1339-4061.jpg?w=740&t=st=1694353564~exp=1694354164~hmac=d6a6fffcb42237ef3f6a5b0ef64851fbba65ea1796cbab733cf4b49eb09b29ef',
                        4);
                        
insert into tbl_tag(
						nome, 
                        imagem, 
                        id_categoria
                        ) values (
                        'Capas de Sofá',
						'https://img.freepik.com/free-photo/interior-living-room-with-sofa-decorative-items_169016-5931.jpg?w=996&t=st=1694353598~exp=1694354198~hmac=236388f4f492eeccaede31c6627b30106af9a1a0c59e68aa029660504f8c8f2a',
                        4);
                        
insert into tbl_tag(
						nome, 
                        imagem, 
                        id_categoria
                        ) values (
                        'Toalhas de Mesa',
						'https://img.freepik.com/free-photo/greek-beach-with-traditional-blue-tables-chairs_661209-443.jpg?w=740&t=st=1694353621~exp=1694354221~hmac=03f8676a6626e1c800f4c32d2839f69edf3137d1526b0b62bc4b5db56a0092c9',
                        4);
                        
insert into tbl_tag(
						nome, 
                        imagem, 
                        id_categoria
                        ) values (
                        'Cobertor',
						'https://img.freepik.com/free-photo/warm-drink-striped-plaid-bedsheet_23-2147887743.jpg?w=740&t=st=1694353662~exp=1694354262~hmac=ea87ba063960ae9cf724709a76b1d933968acc2cfbe26624c9413393fbfee39c',
                        4);
                        
insert into tbl_tag(
						nome, 
                        imagem, 
                        id_categoria
                        ) values (
                        'Jogo Americano',
						'https://img.freepik.com/free-photo/spoon-fork-placed-blue-white-handkerchiefs_1150-20259.jpg?w=740&t=st=1694353664~exp=1694354264~hmac=1ae8c9f0006cd74ef6413fb9601d2e5deebb793d4f128f3a40190a20da38d5e7',
                        4);
                        
#INSERTS
	## ARTESANATO ##
insert into tbl_tag(
						nome, 
                        imagem, 
                        id_categoria
                        ) values (
                        'Boneca de Pano',
						'https://img.freepik.com/free-photo/cute-plush-toys-arrangement_23-2150312306.jpg?w=740&t=st=1694353748~exp=1694354348~hmac=f5897c4df4284f425cde2bffd5bd2be706ebd9029b20d9cd2ddbc5557afbb49e',
                        5);
                        
insert into tbl_tag(
						nome, 
                        imagem, 
                        id_categoria
                        ) values (
                        'Toalha',
						'https://img.freepik.com/free-photo/front-view-stacked-towels-with-bokeh-background_23-2148251811.jpg?w=740&t=st=1694354442~exp=1694355042~hmac=4c64873e6935ad10dd1a001a0af10f1dbae73ff1fbbbd8e7d108512fcc2db441',
                        5);
                        
insert into tbl_tag(
						nome, 
                        imagem, 
                        id_categoria
                        ) values (
                        'Bolsa de Artesanato',
						'https://img.freepik.com/free-photo/high-angle-woman-using-toilet-bag_23-2149764800.jpg?w=740&t=st=1694353791~exp=1694354391~hmac=4ec9f4fcf1e9bd3d0a0c40bd32b946fd771e2179497860c1accffd89137187a2',
                        5);
                        
insert into tbl_tag(
						nome, 
                        imagem, 
                        id_categoria
                        ) values (
                        'Marcador de Livro',
						'https://img.freepik.com/free-photo/high-angle-bookmarks-wooden-board_23-2149894351.jpg?w=740&t=st=1694353795~exp=1694354395~hmac=6141faf61052291d19451df432239bba266a8c2a4c4f2b5927a33cc3f9f63196',
                        5);
                        
insert into tbl_tag(
						nome, 
                        imagem, 
                        id_categoria
                        ) values (
                        'Porta-Moedas',
						'https://img.freepik.com/free-photo/close-up-hands-elegant-woman-sitting-cafe-holding-coffee-stylish-little-purse-with-scarf_285396-7931.jpg?w=360&t=st=1694353855~exp=1694354455~hmac=c2872fc21d0e030505d9624abca8bf774a858bfd98567d5d81342c8d7bf31625',
                        5);
                        
insert into tbl_tag(
						nome, 
                        imagem, 
                        id_categoria
                        ) values (
                        'Porta-Celular',
						'https://img.freepik.com/free-photo/red-leather-women-wallet_1203-8072.jpg?w=740&t=st=1694353857~exp=1694354457~hmac=215b0a86d90df4fc431888c6c36eb13214ac3600bee2a1f7e1d291d14370db39',
                        5);
                        
insert into tbl_tag(
						nome, 
                        imagem, 
                        id_categoria
                        ) values (
                        'Avental',
						'https://img.freepik.com/free-photo/cropped-image-shoemaker-measuring-shoe_171337-12242.jpg?w=740&t=st=1694353920~exp=1694354520~hmac=2f585168d803d7e40cfa1fdb8eb397196b8e4288eaabad6acbd9115e67e00003',
                        5);
                        
insert into tbl_tag(
						nome, 
                        imagem, 
                        id_categoria
                        ) values (
                        'Máscara',
						'https://img.freepik.com/free-photo/woman-showing-how-sew-face-mask_23-2148614622.jpg?w=740&t=st=1694353922~exp=1694354522~hmac=a54102ee6e0d5cf84fe2322b97d8149fb709fc21d65027fc5bf39a0d4b6221df',
                        5);
                        
insert into tbl_tag(
						nome, 
                        imagem, 
                        id_categoria
                        ) values (
                        'Carteira',
						'https://img.freepik.com/free-photo/hand-holding-razor-side-view_23-2149764705.jpg?w=360&t=st=1694353985~exp=1694354585~hmac=d350d9d349e855c56b669891b05ce66a0dde466bba896d911e2109ba2f5cdc58',
                        5);
                        
insert into tbl_tag(
						nome, 
                        imagem, 
                        id_categoria
                        ) values (
                        'Chaveiro de Tecido',
						'https://img.freepik.com/free-photo/hands-sewing-red-heart-shape-wooden-background_23-2148355037.jpg?w=740&t=st=1694353987~exp=1694354587~hmac=91cd6909d60c825be8b5ec9c297516c975443288633d841769dd4b544bba42e1',
                        5);
                        
#INSERTS
	## PETS ##
insert into tbl_tag(
						nome, 
                        imagem, 
                        id_categoria
                        ) values (
                        'Acessórios',
						'https://img.freepik.com/free-photo/front-view-cute-dog-with-red-bow_23-2148326218.jpg?w=740&t=st=1694354125~exp=1694354725~hmac=bbeaa4a14f7a849ceeadb406a12021459addbd2cf59aa78386bd39079c54a563',
                        6);
                        
insert into tbl_tag(
						nome, 
                        imagem, 
                        id_categoria
                        ) values (
                        'Cama',
						'https://img.freepik.com/free-photo/adorable-white-little-puppy_23-2148985895.jpg?w=740&t=st=1694354150~exp=1694354750~hmac=0190ddbd44522651135bf7da0f5dcff7ef2a636f5a30dfcc019e1f0b3e9bbb8e',
                        6);
                        
insert into tbl_tag(
						nome, 
                        imagem, 
                        id_categoria
                        ) values (
                        'Brinquedo',
						'https://img.freepik.com/free-photo/closeup-shot-adorable-small-golden-retriever-pup-lying-purple-carpet-with-blue-toy_181624-32890.jpg?w=740&t=st=1694354152~exp=1694354752~hmac=6d9d5e3c860e64db416cf8d621528426d384a63122950af9ca932521e756e2f9',
                        6);
                        
insert into tbl_tag(
						nome, 
                        imagem, 
                        id_categoria
                        ) values (
                        'Coleira',
						'https://img.freepik.com/free-photo/adorable-white-dog-isolated-yellow_23-2148985983.jpg?w=900&t=st=1694354198~exp=1694354798~hmac=5cc21f5bad7885661d426e2559dc69faa52d6db10877e3dadf8286e9dfac9668',
                        6);
                        
insert into tbl_tag(
						nome, 
                        imagem, 
                        id_categoria
                        ) values (
                        'Laço',
						'https://img.freepik.com/free-photo/dog-with-black-bow-looking-down_23-2148326223.jpg?w=900&t=st=1694354199~exp=1694354799~hmac=806d7e69b4ce88174c1ae336bd9afa7f26f9614c68787cf314ce124ad6bc2d6f',
                        6);
					
insert into tbl_tag(
						nome, 
                        imagem, 
                        id_categoria
                        ) values (
                        'Roupa',
						'https://img.freepik.com/free-photo/white-golden-retriever-posing-studio-with-yellow-scarf-denim-jacket_181624-51744.jpg?w=740&t=st=1694354242~exp=1694354842~hmac=ae8eb814b856e5727381d8a63476246f478709b4bbc750f959f86b8e726ca6e9',
                        6);
                        
insert into tbl_tag(
						nome, 
                        imagem, 
                        id_categoria
                        ) values (
                        'Toalha',
						'https://img.freepik.com/free-photo/dog-lifestyle-care-with-owner_23-2149150806.jpg?w=740&t=st=1694354246~exp=1694354846~hmac=740d6c1ba2bab49f43d0f5667f5ac0ab601e409b5fd9cd13031c6faf2485682a',
                        6);
                        
insert into tbl_tag(
						nome, 
                        imagem, 
                        id_categoria
                        ) values (
                        'Cobertor',
						'https://img.freepik.com/free-photo/beautiful-pet-portrait-small-dog-cat_23-2149218512.jpg?w=740&t=st=1694354297~exp=1694354897~hmac=558c4c2c8afb1c0c27cb3b8997ffc1c90a62f7ee7082d92ed4e6d83d3a57d146',
                        6);
                        
insert into tbl_tag(
						nome, 
                        imagem, 
                        id_categoria
                        ) values (
                        'Fantasia',
						'https://img.freepik.com/free-photo/dog-costume-breed-canine-friend-mammal-animal_53876-41369.jpg?w=740&t=st=1694354298~exp=1694354898~hmac=d2c773d1625eacb6495f8cfb7ef09b9643d2c7a42eb5817f588eb0fa558a476b',
                        6);

insert into tbl_tag_usuario (id_tag, id_usuario) values (11, 1);
insert into tbl_tag_usuario (id_tag, id_usuario) values (41, 2);
insert into tbl_tag_usuario (id_tag, id_usuario) values (42, 1);
insert into tbl_tag_usuario (id_tag, id_usuario) values (43,3);





