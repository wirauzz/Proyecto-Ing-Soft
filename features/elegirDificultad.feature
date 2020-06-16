Feature: Elejir dificultad
    Como: Jugador de "Toros y vacas"
    Quiero: Modificar mi nivel de dificultad
    Para: Hacer mi experiencia de juego mas desafiante

    
Scenario: Elejir dificultad facil
    Given Estoy en la pagina principal
    And Presiono el boton "Opciones" de la pantalla principal
    And elijo en el campo "dificultades" la opcion de "Facil"
    And Presiono el boton el boton "enviar"
    Then Deberia ver la dificultad "Facil" en la pantalla

