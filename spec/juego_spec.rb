require 'juego.rb'

RSpec.describe Juego do

    
    it "Deberia crear un codigo aleatorio" do
        juego = Juego.new()
        expect(juego.generarCodigoAleatorio()).to eq "codgio aleatorio genereado"
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
    
    it 'Deberia ser capaz ingresar un intento' do
        codigo = "125364"
        intento ="145368"
        juego = Juego.new()
        juego.setCodigo(codigo)
        expect(juego.intentarAdivinar(intento))    
    end

    it 'Deberia retornar false cuando ingreso un codigo que no es del mismo tamanio' do
        codigo = "125364"
        intento = "4536"
        juego = Juego.new()
        juego.setCodigo(codigo)
        expect(juego.intentarAdivinar(intento))    
    end
    

    it 'Deberia devolverme que el intento no es valido' do
        codigo = "125364"
        intento = "4536"
        juego = Juego.new()
        juego.setCodigo(codigo)
        expect(juego.intentarAdivinar(intento)).to eq 'las cadenas deben ser del mismo tamanio'    
    end

    it 'Deberia devolverme que el intento no es valido' do
        codigo = "125364"
        intento = "453sd6"
        juego = Juego.new()
        juego.setCodigo(codigo)
        expect(juego.intentarAdivinar(intento)).to eq 'la cadena debe solo contener numeros'    
    end

    it 'Deberia devolverme la cantidad de 2 vacas y 2 toros' do
        codigo ="12536"
        intento ="16435"
        juego = Juego.new()
        juego.setCodigo(codigo)
        expect(juego.intentarAdivinar(intento)).to eq '2 vaca(s) y 2 toro(s)'    
    end

    it 'Deberia devolverme la cantidad de 2 vacas y 1 toro' do
        codigo ="12534"
        intento ="98354"
        juego = Juego.new()
        juego.setCodigo(codigo)
        expect(juego.intentarAdivinar(intento)).to eq '2 vaca(s) y 1 toro(s)'    
    end    

    it 'Deberia tener true si adivino el codigo' do
        codigo ="12536"
        intento ="12536"
        juego = Juego.new()
        juego.setCodigo(codigo)
        expect(juego.intentarAdivinar(intento)).to eq true    
    end

    it 'Deberia tener false si se me acabaron los intentos' do
        codigo ="12536"
        intento ="56164"
        juego = Juego.new()
        juego.setCodigo(codigo)
        for pos in 0...14 do
            juego.intentarAdivinar(intento)
        end
        expect(juego.intentarAdivinar(intento)).to eq false 
    end  
end