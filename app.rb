require 'sinatra'
require './lib/juego.rb'

@@juego = Juego.new

get '/' do
    erb:pantallaPrincipal
end

post '/' do
    @codigo = params[:nuevoCodigo]
 
    @respuesta = @@juego.setCodigo(@codigo)
    erb:pantallaPrincipal
end


get '/juego' do
    erb:pantallaDeIntentos
end


post '/juego' do
    @intentos = params[:nuevoIntento]
    @respuesta = @@juego.intentarAdivinar(@intentos)
    erb:pantallaDeIntentos
end

