Feature: Observar las puntuaciones
Como:	Jugador de vacas y toros
Quiero:	Observar la puntuación	
Para: Observar mi desempeño o observar la de los demás jugadores
    
Scenario: Observar las puntuaciones
    Given Estoy en la pagina principal
    And Lleno el campo "nuevoCodigo" con el valor "12345"
    And presiono el boton de "Validar" que valida el codigp
    And Deberia ver la respuesta de "Codigo aceptado" en el campo "p"
    And Presiono el boton "Jugar" que me lleva a la ventana de adivinar el codigo
    And Lleno en el campo de "nuevoIntento" el valor de "12345"
    And Deberia visitar la pagina de ganador
    And presiono el boton regresar al inicio "Volver_al_inicio"
    And presiono el boton "Ver puntuaciones" de ver puntuaciones
    Then deberia veria ver "1|Invitado|1"