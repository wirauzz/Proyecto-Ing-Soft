require 'juego.rb'

RSpec.describe Juego do
    it "Deberia retornar el codigo secreto por defecto" do
        juego = Juego.new()
        expect(juego.getCodigo()).to eq ''
    end


    it 'Deberia poder setear un nuevo codigo secreto' do
        codigo = "125364"
        juego = Juego.new()
        juego.setCodigo(codigo)
        expect(juego.getCodigo()).to eq codigo    
    end

    it 'Por el momento no hace nada' do
        codigo = "125364"
        juego = Juego.new()
        juego.setCodigo(codigo)
        expect(juego.codigoValido())    
    end
end