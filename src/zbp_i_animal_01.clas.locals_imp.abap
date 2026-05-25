CLASS lhc_Animal DEFINITION INHERITING FROM cl_abap_behavior_handler.

   PUBLIC SECTION.
    CLASS-DATA t_ztanimal_01 TYPE STANDARD TABLE OF ztanimal_01.

  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Animal RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE Animal.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE Animal.

    METHODS read FOR READ
      IMPORTING keys FOR READ Animal RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK Animal.

ENDCLASS.

CLASS lhc_Animal IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

    METHOD create.

      IF entities IS NOT INITIAL.

        SELECT SINGLE MAX( id )
          FROM ztanimal_01
          INTO @DATA(lv_max_id).

        LOOP AT entities INTO DATA(ls_entity).

          IF ls_entity-%data-sexo <> 'M'
       AND ls_entity-%data-sexo <> 'F'.

      APPEND VALUE #(
        %cid = ls_entity-%cid
      ) TO failed-animal.

      APPEND VALUE #(
        %cid = ls_entity-%cid
        %msg = new_message_with_text(
                 severity = if_abap_behv_message=>severity-error
                 text     = 'Inválido. Utilize M (Masculino) ou F (Feminino).'
               )
      ) TO reported-animal.

      CONTINUE.

    ENDIF.

          lv_max_id += 1.
          ls_entity-%data-id = lv_max_id.

          INSERT CORRESPONDING #( ls_entity-%data )
            INTO TABLE t_ztanimal_01.

        ENDLOOP.

      ENDIF.

    ENDMETHOD.

  METHOD delete.

     LOOP AT keys INTO DATA(ls_key).
        DELETE FROM ztanimal_01
        WHERE id = @ls_key-id.
     ENDLOOP.

  ENDMETHOD.

   METHOD read.

    SELECT *
    FROM ztanimal_01
    FOR ALL ENTRIES IN @keys
    WHERE id EQ @keys-id
    INTO CORRESPONDING FIELDS OF TABLE @result.

  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZI_ANIMAL_01 DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZI_ANIMAL_01 IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.

    INSERT ztanimal_01 FROM TABLE @lhc_animal=>t_ztanimal_01.

  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
