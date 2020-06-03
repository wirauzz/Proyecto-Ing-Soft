require 'juego.rb'

RSpec.describe Juego do
    it "Deberia retornar el codigo secreto" do
        codigo = "125364"
        juego = Juego.new(codigo)
        expect(juego.getCodigo()).to eq codigo
    end

end