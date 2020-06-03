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

    it 'Deberia poder setear un nuevo codigo secreto' do
        codigo = "125364"
        juego = Juego.new()
        expect(juego.setCodigo(codigo)).to eq 'codigo aceptado'   
    end

    it 'Deberia no deberia ser posible setear un el siguiente codigo: 125364fdsasd' do
        codigo = "125364f"
        juego = Juego.new()
        expect(juego.setCodigo(codigo)).to eq 'codigo no valido'    
    end

    it 'Deberia no deberia ser posible setear el siguiente codigo:1253644 ' do
        codigo = "1253644"
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