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

    it 'No deberia ser posible setear un el siguiente codigo: 125364fdsasd' do
        codigo = "125364f"
        juego = Juego.new()
        expect(juego.setCodigo(codigo)).to eq 'codigo no valido'    
    end

    it 'No deberia ser posible setear el siguiente codigo:1253644 ' do
        codigo = "1254364"
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
    
    it 'Debria ser capaz ingresar un intento' do
        codigo = "125364"
        intento = "4536"
        juego = Juego.new()
        juego.setCodigo(codigo)
        expect(juego.intentarAdivinar(intento))    
    end

    it 'Debria devolverme que el intento no es valido' do
        codigo = "125364"
        intento = "4536"
        juego = Juego.new()
        juego.setCodigo(codigo)
        expect(juego.intentarAdivinar(intento)).to eq 'las cadenas deben ser del mismo tamaño'    
    end

    it 'Debria devolverme que el intento no es valido' do
        codigo = "125364"
        intento = "453sd6"
        juego = Juego.new()
        juego.setCodigo(codigo)
        expect(juego.intentarAdivinar(intento)).to eq 'la cadena debe solo contener numeros'    
    end

    it 'Debria devolverme la cantidad de 4 vacas y 1 toro' do
        codigo = "125364"
        intento ="196435"
        juego = Juego.new()
        juego.setCodigo(codigo)
        expect(juego.intentarAdivinar(intento)).to eq '4 vaca(s) y 1 toro(s)'    
    end

    it 'Debria devolverme la cantidad de 1 vaca y 2 toros' do
        codigo = "125364"
        intento ="987354"
        juego = Juego.new()
        juego.setCodigo(codigo)
        expect(juego.intentarAdivinar(intento)).to eq '1 vaca(s) y 2 toro(s)'    
    end

end