Feature: ingreso codigo secreto
Como:	Jugador 1 de Toros y vacas
Quiero:	Ingresar el codigo secreto	
Para:	Que el jugador 2 intente adivniar el codigo ingresado	

    
Scenario: Elejir dificultad facil
    Given Estoy en la pagina principal
    And Lleno el campo "nuevoCodigo" con el valor "12345"
    And presiono el boton de "Validar" que valida el codigp
      And Deberia ver la respuesta de "Codigo aceptado" en el campo "p"
  