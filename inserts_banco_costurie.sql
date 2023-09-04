use db_tcc_costurie;

drop database db_tcc_costurie;

show tables;

#### ESTADO ####

#INSERTS
insert into tbl_estado(nome)values("Acre");
insert into tbl_estado(nome)values("São Paulo");
insert into tbl_estado(nome)values("Minas Gerais");
insert into tbl_estado(nome)values("Rio de Janeiro");
insert into tbl_estado(nome)values("Mato Grosso do Sul");
insert into tbl_estado(nome)values("Mato Grosso do Sula");

#SELECT
select * from tbl_estado;

#UPDATE
update tbl_estado set nome = 'Mato GROSSO' where id = 6;

#DELETE
delete from tbl_estado where id <= 6;



#### CIDADE ####

#INSERTS
insert into tbl_cidade(nome, id_estado)values("Acrelandia", '1');
insert into tbl_cidade(nome, id_estado)values("Barueri", '2');
insert into tbl_cidade(nome, id_estado)values("Uberaba", '3');
insert into tbl_cidade(nome, id_estado)values("Rio de Janeiro", '4');


#SELECT
select tbl_cidade.id as id, tbl_cidade.nome as nome_cidade, tbl_estado.nome as nome_estado 
	from tbl_cidade 
		inner join tbl_estado
			on tbl_estado.id = tbl_cidade.id_estado;

#UPDATE
update tbl_cidade set nome = 'Mato GROSSO' where id = 5;

#DELETE
delete from tbl_estado where id = 6;


### LOCALIZACAO ###

#INSERTS
insert into tbl_localizacao(bairro, id_cidade) values ('Acrinho', 1);
insert into tbl_localizacao(bairro, id_cidade) values ('Engenho Novo', 2);
insert into tbl_localizacao(bairro, id_cidade) values ('Paulista', 3);
insert into tbl_localizacao(bairro, id_cidade) values ('RJ', 4);

#SELECT
select tbl_localizacao.id as id, tbl_localizacao.bairro, tbl_cidade.nome as nome_cidade
	from tbl_localizacao
		inner join tbl_cidade
			on tbl_cidade.id = tbl_localizacao.id_cidade;
            
            
            
### USUARIO ###

#INSERT
insert into tbl_usuario(nome_de_usuario, email, senha) values ('mumuzin15', 'mumuzi@gmail.com', '12345678');
insert into tbl_usuario(nome_de_usuario, email, senha) values ('andrezito', 'andredograu@gmail.com', '123456789');

select * from tbl_usuario;


