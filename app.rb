require 'sinatra'
require './lib/juego.rb'



get '/' do
    erb:pantallaPrincipal
end

post '/' do
    @codigo = params[:nuevoCodigo]
    @juego = Juego.new
    @respuesta = @juego.setCodigo(@codigo)
    erb:pantallaPrincipal
end