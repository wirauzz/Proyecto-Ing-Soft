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
        puntuacionPedro = Puntuacion.new
        puntuacion.setNombre("Wilson")
        puntuacion.setPuntuacion(3)
        puntuacionJose.setNombre("Jose")
        puntuacionJose.setPuntuacion(10)        
        nuevaPuntuacionWil.setNombre("Wilson")
        nuevaPuntuacionWil.setPuntuacion(1)
        lista.agregarScore(puntuacion)
        lista.agregarScore(puntuacionJose)
        lista.agregarScore(nuevaPuntuacionWil)
        expect(lista.getPuntuacion(0)).to eq nuevaPuntuacionWil
    end

    it "Deberia devolverme el primer score 999 por defecto" do        
        lista = Puntuaciones.new()
        expect(lista.getPuntuacion(0).getPuntuacion()).to eq 999
    end




end
