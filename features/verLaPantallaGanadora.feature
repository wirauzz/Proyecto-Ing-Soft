Feature: Ingreso un intento que gana el juego
Como:	Jugador 1 de Toros y vacas
Quiero:	Que muestre un mensaje de que adivino el codigo con exito.	
Para:	Dar a conocer que gano el juego	

    
Scenario: Ganar juego
    Given Estoy en la pagina principal
    And Lleno el campo "nuevoCodigo" con el valor "12345"
    And presiono el boton de "Validar" que valida el codigp
    And Deberia ver la respuesta de "Codigo aceptado" en el campo "p"
    And Presiono el boton "Jugar" que me lleva a la ventana de adivinar el codigo
    And Lleno en el campo de "nuevoIntento" el valor de "12345"
    Then Deberia visitar la pagina de ganador