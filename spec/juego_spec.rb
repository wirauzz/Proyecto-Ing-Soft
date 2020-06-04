require 'juego.rb'

RSpec.describe Juego do
    it "Recibe una cantidad de intentos" do
        juego = Juego.new()
        expect(juego.intentos()).to eq '3'
    end
    it "Recibe un limite de codigo" do
        juego = Juego.new()
        expect(juego.tamCodigo()).to eq '6'
    end
end