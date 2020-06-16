Feature:
Como: Jugador de toros y vacas
Quiero: Colocar un nombre de jugador
Para: Tener una experiencia mas personalizada

Scenario:
Given Estoy en la pagina de bienvenida
When lleno el campo "nombre" con "mi_nombre"
And presiono el boton "Ingresar"
Then Deberia ver "mi_nombre" en la pantalla





