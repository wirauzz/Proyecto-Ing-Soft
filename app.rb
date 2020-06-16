require 'sinatra'
require './lib/juego'
require './lib/jugador'
require './lib/puntuacion'
require './lib/puntuaciones'

@@juego = Juego.new
@@jugador = Jugador.new
@@score = Puntuaciones.new

get '/' do
    erb:pantallaDeBienvenida
end

post '/' do
    @nombreJugador = params[:nombre]
    @@jugador.setNombre(@nombreJugador)
    erb:pantallaPrincipal
end


get '/inicio' do
    @@juego.resetGame
    erb:pantallaPrincipal
end 

post '/inicio' do
    @codigo = params[:nuevoCodigo]
    @codigoRespuesta = @@juego.setCodigo(@codigo)
    erb:pantallaPrincipal
end

get '/codigoAleatorio' do
    @respuestac = @@juego.generarCodigoAleatorio()
    erb:pantallaPrincipal
end

post '/opciones' do
    
    erb:pantallaDeOpciones
end

post '/confirmarCambios' do
    @dificultad = params[:dificultades]
    @@juego.setDificultad(@dificultad)
    @respDificultadActual = @@juego.getDificultad()
    @respIntentos = @@juego.getIntento()
    @respTamanoCodigo = @@juego.getTamCodigo()
    erb:pantallaDeConfirmacionDeOpciones
end

get '/juego' do
    if(@@juego.getCodigo()!='') then
        erb:pantallaDeIntentos
    else
        @EstatusJuego = "¡Aun no definiste el codigo secreto!"
        erb:pantallaPrincipal
    end
end

get '/scores' do
    erb:pantallaDeScores
end

post '/juego' do
    @respuesta=''
    @intentosTotales = @@juego.getIntentosRealizados()
    @intentos = params[:nuevoIntento]
    @respuesta = @@juego.intentarAdivinar(@intentos)
    if(@respuesta == true || @respuesta==false) then
        if(@respuesta==false) then
            erb:pantallaPerdiste
        else
            @nuevaPuntuacion = Puntuacion.new
            @nuevaPuntuacion.setNombre(@@jugador.getNombre())
            @nuevaPuntuacion.setPuntuacion(@intentosTotales)
            @@score.agregarScore(@nuevaPuntuacion)
            erb:pantallaGanaste
        end
    else
        erb:pantallaDeIntentos
    end
end

