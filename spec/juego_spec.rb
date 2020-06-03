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

    it 'Deberia no deberia ser posible setear un nuevo codigo secreto' do
        codigo = "125364fdsasd"
        juego = Juego.new()
        expect(juego.setCodigo(codigo)).to eq 'codigo no valido'    
    end

    it 'Deberia dar verdadero si el codigo contiene solo numeros' do
        codigo = "125364"
        juego = Juego.new()
        expect(juego.soloNumeros(codigo)).to eq true    
    end

    it 'Deberia dar false si el codigo no contiene solo numeros' do
        codigo = "125364d"
        juego = Juego.new()
        expect(juego.soloNumeros(codigo)).to eq false    
    end

    it 'Deberia dar true si el codigo no tiene numeros repetidos' do
        codigo = "125364"
        juego = Juego.new()
        expect(juego.caracteresRepetidos(codigo)).to eq true    
    end
    
    it 'Deberia dar false si el codigo tiene numeros repetidos' do
        codigo = "1253664"
        juego = Juego.new()
        expect(juego.caracteresRepetidos(codigo)).to eq false    
    end
end