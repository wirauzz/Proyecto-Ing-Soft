require 'sinatra'
require './lib/juego'

get '/' do
    erb:pantallaPrincipal
end


post '/crearLimite' do
    erb:limite
end

post '/formato' do
    juego = Juego.new()
    @intentos = params[:intentos]
    @tamañoCodigo = params[:tamañoCodigo]
    erb:condicion
end

post '/otroIntento' do
    erb:intentos
end