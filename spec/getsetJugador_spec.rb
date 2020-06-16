require 'jugador.rb'

RSpec.describe Jugador do
    it "Deberia devolverme Wilson cuando hago el set del nombre" do
        jugador = Jugador.new()
        jugador.setNombre("Wilson")
        expect(jugador.getNombre()). to eq "Wilson"
    end

    it "Recibe el nombre por defecto del jugador" do
        jugador = Jugador.new()
        expect(jugador.getNombre()). to eq "Invitado"     
    end
end
