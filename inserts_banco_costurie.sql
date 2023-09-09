use db_tcc_costurie;

##drop database db_tcc_costurie;

show tables;


################ LOCALIZACAO ################

#INSERTS
insert into tbl_localizacao(bairro, cidade, estado) values ('Acrinho', 'Acrelandia', 'AC');
insert into tbl_localizacao(bairro, cidade, estado) values ('Engenho Novo', 'Barueri', 'SP');
insert into tbl_localizacao(bairro, cidade, estado) values ('Paulista', 'São Paulo', 'SP');
insert into tbl_localizacao(bairro, cidade, estado) values ('Niteroi', 'Rio', 'RJ');

#SELECT
select * from tbl_localizacao;

            
            
            
################ USUARIO ################

#INSERT
insert into tbl_usuario(nome_de_usuario, email, senha) values ('mumuzin15', 'mumuzi@gmail.com', '12345678');
insert into tbl_usuario(nome_de_usuario, email, senha) values ('andrezito', 'andredograu@gmail.com', '123456789');
insert into tbl_usuario(
						nome, 
                        descricao, 
                        foto, 
                        nome_de_usuario, 
                        email, 
                        senha
                        ) values ('
                        Andre', 
						'amo igreja e saxofone', 
						'data:image/jpeg;base64,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',
						'andrezinhoooo',
                        'andredograu@gmail.com', 
						'123456789');

desc tbl_usuario;

#SELECT
select * from tbl_usuario where id = 3;
select * from tbl_usuario;

select tbl_usuario.id, tbl_usuario.nome_de_usuario, tbl_usuario.email as email_usuario, tbl_usuario.senha as senha_usuario from tbl_usuario where id = 3;

#UPDATE
update tbl_usuario set 
					nome = '',
					descricao = '',
					foto = '',
                    nome_de_usuario = '',
					email = '',
                    senha = ''
                where id = 4;
                
#UPDATE SENHA - ESQUECI SENHA
update tbl_usuario set senha = 'amopeitos' where id = 12;

#DELETE
delete from tbl_usuario where id = 10;



################ CATEGORIA ################

#INSERT 
insert into tbl_categoria(nome) values ('Vestuário');
insert into tbl_categoria(nome) values ('Acessórios');
insert into tbl_categoria(nome) values ('Ajustes e Reparos');
insert into tbl_categoria(nome) values ('Decoração');
insert into tbl_categoria(nome) values ('Artesanato');
insert into tbl_categoria(nome) values ('Pets');

#SELECT
select * from tbl_categoria;



################ TAG ################

#INSERT