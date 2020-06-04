require 'sinatra'
require './lib/juego'
@@juego = Juego.new

get '/' do
    @@juego.resetGame
    erb:pantallaPrincipal
end


delete '/' do
    @@juego.resetGame
    erb:pantallaPrincipal
end

post '/crearLimite' do
    @intentosActuales = @@juego.getIntento.to_i
    @tamañoCodigo = @@juego.getTamCodigo.to_i
    erb:limite
end

post '/formato' do
    @intentos = params[:intentos]
    @tamañoCodigo = params[:tamanoCodigo]
    @@juego.setIntento(@intentos.to_i)
    @@juego.setTamCodigo(@tamañoCodigo.to_i)
    erb:condicion
end

post '/' do
    @codigo = params[:nuevoCodigo]
    @respuesta = @@juego.setCodigo(@codigo)
    erb:pantallaPrincipal
end


get '/juego' do
    if(@@juego.getCodigo()!='') then
        erb:pantallaDeIntentos
    else
        @respuesta = "¡Aun no definiste el codigo secreto!"
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

