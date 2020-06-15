require 'sinatra'
require './lib/juego'
@@juego = Juego.new

get '/' do
    @@juego.resetGame
    erb:pantallaPrincipal
end


get '/codigoAleatorio' do
    @respuestac = @@juego.generarCodigoAleatorio()
    erb:pantallaPrincipal
end

post '/crearLimite' do
    @dificultad = params[:dificultad]
    @@juego.setDificultad(@dificultad)
    erb:limite
end

post '/formato' do
    @intentos = params[:intentos]
    @tamañoCodigo = params[:tamañoCodigo]
    @dificultad=@@juego.dificultad()
    if(@@juego.verificarDificultad(@tamañoCodigo.to_i,@dificultad)) then
        erb:condicion
    else
        
        @respuesta = "El tamaño no es adecuado para la dificultad"
        erb:limite
    end
end

post '/' do
    @codigo = params[:nuevoCodigo]
    @codigoRespuesta = @@juego.setCodigo(@codigo)
    erb:pantallaPrincipal
end


get '/juego' do
    if(@@juego.getCodigo()!='') then
        erb:pantallaDeIntentos
    else
        @EstatusJuego = "¡Aun no definiste el codigo secreto!"
        erb:pantallaPrincipal
    end
end


post '/juego' do
    @respuesta=''
    @intentos = params[:nuevoIntento]
    @respuesta = @@juego.intentarAdivinar(@intentos)
    if(@respuesta == true || @respuesta==false) then
        if(@respuesta==false) then
            erb:pantallaPerdiste
        else
            erb:pantallaGanaste
        end
    else
        erb:pantallaDeIntentos
    end
end

