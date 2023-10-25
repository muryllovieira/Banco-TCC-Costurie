use db_tcc_costurie;

########## PROCEDURE PARA INSERIR NA PUBLICACAO NO USUARIO EM TUDO #########

-- CREATE PROCEDURE sp_publicacao_tag(
--     IN p_id_usuario INT,
--     IN p_titulo VARCHAR(45),
--     IN p_descricao VARCHAR(500),
--     IN p_anexo TEXT,
--     IN p_tags VARCHAR(255)
-- )
-- BEGIN
--     DECLARE v_publicacao_id INT;
--     INSERT INTO publicacao (id_usuario, titulo, descricao, data_publicacao)
--     VALUES (p_Id_usuario, p_titulo, p_descricao, p_anexo, NOW());
--     
--     SET v_publicacao_id = LAST_INSERT_ID();  -- Captura o ID da última inserção
--     
--     -- Insira as tags associadas à publicação na tabela tbl_tag_publicacao
--     INSERT INTO tbl_tag_publicacao (id_tag, id_usuario, id_publicacao)
--     SELECT id_tag, p_Id_usuario, v_publicacao_id
--     FROM tags
--     WHERE FIND_IN_SET(nome_tag, p_tags) > 0;
-- END //
-- DELIMITER ;

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


# Localização -> Usuario
DELIMITER //
create procedure sp_update_localizacao_usuario(
	id_usuario int,
    bairro varchar(255),
    cidade varchar(255), 
    estado varchar(255)
)
begin
--     update tbl_localizacao set 
--         tbl_localizacao.cidade = cidade,
--         tbl_localizacao.bairro = bairro,
--         tbl_localizacao.estado = estado
-- 	where tbl_localizacao.id = id_localizacao;
	
    insert into tbl_localizacao (
								cidade, 
                                bairro,
                                estado
                                ) values 
                                (
								cidade,
								bairro,
                                estado
                                );
        
	update tbl_usuario as usuario set
        usuario.id_localizacao = new.id_localizacao
    where usuario.id = id_usuario;
    
end //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_insert_localizacao_usuario(
    id_usuario INT,
    bairro VARCHAR(255),
    cidade VARCHAR(255),
    estado VARCHAR(255)
)
BEGIN
    DECLARE new_id_localizacao INT; -- Variável para armazenar o ID da nova localização.

    -- Insira os novos valores de localização na tabela tbl_localizacao.
    INSERT INTO tbl_localizacao (cidade, bairro, estado)
    VALUES (cidade, bairro, estado);

    -- Obtenha o ID da nova localização inserida.
    SET new_id_localizacao = LAST_INSERT_ID();

    -- Atualize a tabela tbl_usuario com o ID da nova localização.
    UPDATE tbl_usuario AS usuario
    SET usuario.id_localizacao = new_id_localizacao
    WHERE usuario.id = id_usuario;

END //
DELIMITER ;


-- drop procedure sp_update_endereco_usuario_tag;
