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

post '/opciones' do
    @dificultad = params[:dificultad]
    @@juego.setDificultad(@dificultad)
    erb:pantallaDeOpciones
end

post '/confirmarCambios' do
    @intentos = @@juego.getIntento()
    @tamañoCodigo = @@juego.getTamCodigo()
    @dificultadActual= params[:dificultades]
    @@juego.setDificultad(@dificultadActual)
    erb:pantallaDeConfirmacionDeOpciones
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

