Feature: Ingreso un intento para adivinar el codigo
Como:	Jugador 2 de "Toros y vacas"	
Quiero:	Ingresar un intento 	
Para:	Adivinar el código secreto.	

    
Scenario: Elejir dificultad facil
    Given Estoy en la pagina principal
    And Lleno el campo "nuevoCodigo" con el valor "12345"
    And presiono el boton de "Validar" que valida el codigp
    And Deberia ver la respuesta de "Codigo aceptado" en el campo "p"
    And Presiono el boton "Jugar" que me lleva a la ventana de adivinar el codigo
    And Lleno en el campo de "nuevoIntento" el valor de "12346"
    Then Deberia ver en el campo "p" "4 toro(s) y 0 vaca(s)"