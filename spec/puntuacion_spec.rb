require 'puntuacion.rb'

RSpec.describe Puntuacion do
    it "Deberia devolverme Wilson cuando hago el set del nombre" do
        puntuacion = Puntuacion.new()
        puntuacion.setNombre("Wilson")
        expect(puntuacion.getNombre()). to eq "Wilson"
    end

    it "Deberia recibir la puntuacion de 8" do
        puntuacion = Puntuacion.new()
        puntuacion.setPuntuacion(8)
        expect(puntuacion.getPuntuacion()). to eq 8     
    end
end
