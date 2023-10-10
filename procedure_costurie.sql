use db_tcc_costurie;

########## PROCEDURE PARA INSERT #########

# Endereco -> Usuario
-- DELIMITER //
-- create procedure sp_inserir_endereco_usuario(
--     bairro varchar(255),
--     cidade varchar(255),
--     estado varchar(50),
--     cep varchar(10),
--     nome varchar(60),
--     cpf varchar(15),
--     data_nascimento date,
--     email varchar(255),
--     senha varchar(256)
-- )
-- begin
--     declare id_endereco int;
--     
--     if char_length(cep) = 0 or cep = null then 
--     
-- 		insert into tbl_endereco(
-- 			logradouro,
-- 			bairro,
-- 			cidade,
-- 			estado
-- 		) values (
-- 			logradouro,
--             bairro,
--             cidade,
--             estado
-- 		);
--     
--     else
-- 		insert into tbl_endereco(
-- 			logradouro,
-- 			bairro,
-- 			cidade,
-- 			estado,
--             cep
-- 		) values (
-- 			logradouro,
--             bairro,
--             cidade,
--             estado,
--             cep
-- 		);

--    end if; 
--    
--    set id_endereco = last_insert_id();
-- 	
-- 		insert into tbl_usuario(
-- 			nome,
--             cpf,
--             data_nascimento,
--             email,
--             senha,
--             id_endereco
--         )values(
-- 			nome,
--             cpf,
--             data_nascimento,
--             email,
--             senha,
--             id_endereco
--         );
-- end //
-- DELIMITER ;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ---- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ---- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- ---- -- -- -- --

########## PROCEDURE PARA UPDATE #########

# Endereco -> Usuario
DELIMITER //
create procedure sp_update_endereco_usuario_tag(
	id_usuario int,
    id_localizacao int,
    bairro varchar(255),
    cidade varchar(255), 
    estado varchar(255),
    nome varchar(60),
    descricao varchar(255),
    foto text,
    nome_de_usuario varchar(100)
)
begin
    update tbl_localizacao set 
        tbl_localizacao.cidade = cidade,
        tbl_localizacao.bairro = bairro,
        tbl_localizacao.estado = estado
	where tbl_localizacao.id = id_localizacao;
        
	update tbl_usuario as usuario set
		usuario.nome = nome,
        usuario.descricao = descricao,
        usuario.foto = foto,
        usuario.nome_de_usuario = nome_de_usuario,
        usuario.id_localizacao = id_localizacao
    where usuario.id = id_usuario;
    
end //
DELIMITER ;

drop procedure sp_update_endereco_usuario_tag;
