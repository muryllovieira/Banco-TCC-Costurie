use db_tcc_costurie;

show triggers;

drop trigger trg_apagar_publicacao;


##ARRUMAR ESSA TRIGGER PARA TAG TBM
DELIMITER //
CREATE TRIGGER trg_apagar_publicacao
BEFORE DELETE ON tbl_publicacao
FOR EACH ROW
BEGIN
    DECLARE publicacao_id INT;
    
    #Pegar o ID que vai ser deletado do meu banco
    SET publicacao_id = OLD.id;
    
    #Remover da tag_publicacao
    DELETE FROM tbl_tag_publicacao WHERE id_publicacao = publicacao_id;

    #Remover da de anexo
    DELETE FROM tbl_anexo_publicacao WHERE id_publicacao = publicacao_id;

END;
//
DELIMITER ;

