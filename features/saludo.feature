Feature:
Como Jugador
Quiero quiero poder ingresar mi nombre
Para ser saludado con mi nombre

Scenario:
Given Estoy en la pagina de bienvenida
When lleno el campo "nombre" con "mi_nombre"
And presiono el boton "Ingresar"
Then Deberia ver "mi_nombre" en la pantalla





