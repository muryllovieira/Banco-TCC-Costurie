use db_tcc_costurie;

show triggers;

drop trigger trg_apagar_publicacao;

## TRIGGER PARA APAGAR UMA PUBLICACAO
DELIMITER //
CREATE TRIGGER trg_apagar_publicacao
BEFORE DELETE ON tbl_publicacao
FOR EACH ROW
BEGIN
    DECLARE publicacao_id INT;
    
    # Pegar o ID que vai ser deletado da minha tabela tbl_publicacao
    SET publicacao_id = OLD.id;
    
    # Remover da tabela tbl_tag_publicacao
    DELETE FROM tbl_tag_publicacao WHERE id_publicacao = publicacao_id;

    # Remover da tabela tbl_anexo_publicacao
    DELETE FROM tbl_anexo_publicacao WHERE id_publicacao = publicacao_id;

	# Remover da tabela de avaliacao publicacao
    DELETE FROM tbl_avaliacao_publicacao WHERE id_publicacao = publicacao_id;
    
    # Remover da tabela de comentario
    DELETE FROM tbl_comentario WHERE id_publicacao = publicacao_id;

END;
//
DELIMITER ;


## TRIGGER PARA APAGAR UM COMENTARIO
DELIMITER //
CREATE TRIGGER trg_apagar_comentario
BEFORE DELETE ON tbl_comentario
FOR EACH ROW
BEGIN
    DECLARE comentario_id INT;
    
    # Pegar o ID que vai ser deletado da minha tabela tbl_comentario
    SET comentario_id = OLD.id;
    
    # Remover da tabela tbl_resposta_comentario
    DELETE FROM tbl_resposta_comentario WHERE id_comentario = comentario_id;

END;
//
DELIMITER ;
