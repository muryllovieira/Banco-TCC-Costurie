use db_tcc_costurie;

#TRIGGER PARA DELETAR DA TABELA DE TAG_USUARIO
DELIMITER //
CREATE TRIGGER delete_usuario_on_tag_usuario
BEFORE DELETE ON tbl_usuario
FOR EACH ROW
BEGIN
    DELETE FROM tbl_tag_usuario WHERE id_usuario = OLD.id;
END;
//
DELIMITER ;

