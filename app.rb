require 'sinatra'
require './lib/juego'
@@juego = Juego.new

get '/' do
    erb:pantallaPrincipal
end


post '/crearLimite' do
    @dificultad = params[:dificultad]
    @@juego.setDificultad(@dificultad)
    erb:limite
end

post '/formato' do
    juego = Juego.new()
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

post '/otroIntento' do
    erb:intentos
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
    @intentos = params[:nuevoIntento]
    @respuesta = @@juego.intentarAdivinar(@intentos)
    erb:pantallaDeIntentos
end

