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
    
    # Pegar o ID que esta sendo deletado
    SET publicacao_id = OLD.id;

    # Remover da tabela de anexo
    DELETE FROM tbl_anexo_publicacao WHERE id_publicacao = publicacao_id;

END;
//

DELIMITER ;
