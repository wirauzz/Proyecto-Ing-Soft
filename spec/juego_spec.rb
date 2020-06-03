require 'juego.rb'

RSpec.describe Juego do
    it "Deberia retornar el codigo secreto" do
        juego = Juego.new()
        expect(juego.getCodigo()).to eq ''
    end
    
end