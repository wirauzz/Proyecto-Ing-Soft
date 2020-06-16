require 'puntuaciones.rb'
require 'puntuacion.rb'


RSpec.describe Puntuaciones do
    it "Deberia devolverme el primer score seteado" do
        puntuacion = Puntuacion.new()
        puntuacion.setNombre("Wilson")
        puntuacion.setPuntuacion(5)
        lista = Puntuaciones.new()
        lista.setPuntuacion(puntuacion,0)
        expect(lista.getPuntuacion(0)).to eq puntuacion
    end


    it "Deberia devolverme la puntuacion de jose " do
        lista = Puntuaciones.new
        puntuacion = Puntuacion.new
        puntuacionJose = Puntuacion.new

        puntuacion.setNombre("Wilson")
        puntuacion.setPuntuacion(5)

        puntuacionJose.setNombre("Jose")
        puntuacionJose.setPuntuacion(10)
        lista.agregarScore(puntuacion)
        lista.agregarScore(puntuacionJose)
        expect(lista.getPuntuacion(1).getPuntuacion()).to eq puntuacionJose.getPuntuacion()
    end

    it "Deberia devolverme el primer score 999 por defecto" do        
        lista = Puntuaciones.new()
        expect(lista.getPuntuacion(0).getPuntuacion()).to eq 999
    end




end
