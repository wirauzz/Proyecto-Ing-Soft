require 'juego.rb'

RSpec.describe Juego do

    it "Muestra la cantidad de intentos por defecto" do
        juego = Juego.new()
        expect(juego.getIntento()).to eq 10
    end

    it "Recibe un limite de codigo por defecto" do
        juego = Juego.new()
        expect(juego.getTamCodigo()).to eq 5
    end

    it "Deberia crear un codigo aleatorio" do
        juego = Juego.new()
        expect(juego.generarCodigoAleatorio()).to eq "codgio aleatorio genereado"
    end
    
    it "Deberia retornar el tamaño que puede llegar a tener el codigo" do
        juego = Juego.new()
        juego.setTamCodigo(10)
        expect(juego.getTamCodigo()).to eq 10
    end

    it "Deberia retornar la cantidad de intentos que puede realizar" do
        juego = Juego.new()
        juego.setIntento(20)
        expect(juego.getIntento()).to eq 20
    end

    it "Deberia retornar el codigo secreto por defecto" do
        juego = Juego.new()
        expect(juego.getCodigo()).to eq ''
    end

    it 'Deberia poder setear y obtener el codigo secreto' do
        codigo = "12534"
        juego = Juego.new()
        juego.setCodigo(codigo)
        expect(juego.getCodigo()).to eq codigo    
    end

    it 'Deberia poder setear un nuevo codigo secreto' do
        codigo = "12584"
        juego = Juego.new()
        expect(juego.setCodigo(codigo)).to eq 'codigo aceptado'   
    end

    it 'No deberia ser posible setear un el siguiente codigo: 125364fdsasd' do
        codigo = "125364fdsasd"
        juego = Juego.new()
        expect(juego.setCodigo(codigo)).to eq 'codigo no valido'    
    end

    it 'No deberia ser posible setear el siguiente codigo:1253644 ' do
        codigo = "12544"
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

    it 'Deberia devolverme aumentar en 1 mis intentos' do
        codigo ="12534"
        intento ="98354"
        juego = Juego.new()
        juego.setCodigo(codigo)
        juego.intentarAdivinar(intento)
        expect(juego.getIntentosRealizados).to eq 2    
    end    

    it 'Deberia devolverme aumentar en 1 mis intentos quedando con 3 intentos realizados' do
        codigo ="12534"
        intento ="98354"
        juego = Juego.new()
        juego.setCodigo(codigo)
        juego.intentarAdivinar(intento)
        juego.intentarAdivinar(intento)
        expect(juego.getIntentosRealizados).to eq 3
    end    



    it 'Debria devolverme vacio si edito el tamaño del codigo habiendo definido un codigo anterior' do
        codigo ="12534"
        juego = Juego.new()
        juego.setCodigo(codigo)
        juego.setTamCodigo(4)
        expect(juego.getCodigo()).to eq ''    
    end    

    it 'Debria devolverme el codigo nuevo si edito el tamaño del codigo habiendo definido un codigo anterior' do
        codigo ="12534"
        juego = Juego.new()
        juego.setCodigo(codigo)
        juego.setTamCodigo(4)
        nuevoCodigo = '1234'
        juego.setCodigo(nuevoCodigo)
        expect(juego.getCodigo()).to eq nuevoCodigo    
    end    



    it 'Deberia tener true si adivino el codigo' do
        codigo ="12536"
        intento ="12536"
        juego = Juego.new()
        juego.setCodigo(codigo)
        expect(juego.intentarAdivinar(intento)).to eq true    
    end

    it 'Ingreso difucultad Facil y devuelve Facil' do
        difucultad ="Facil"
        juego = Juego.new()
        juego.setDificultad(difucultad)
        expect(juego.dificultad(difucultad)).to eq 'Facil'    
    end
    it 'Ingreso difucultad Media y devuelve Media' do
        difucultad ="Media"
        juego = Juego.new()
        juego.setDificultad(difucultad)
        expect(juego.dificultad(difucultad)).to eq 'Media'    
    end
    it 'Ingreso difucultad Dificil y devuelve Dificil' do
        difucultad ="Dificil"
        juego = Juego.new()
        juego.setDificultad(difucultad)
        expect(juego.dificultad(difucultad)).to eq 'Dificil'    
    end

    it 'Ingreso tamaño 4 en difucultad Dificil y devuelve error' do
        difucultad ="Dificil"
        tamaño = 4
        juego = Juego.new()
        juego.setDificultad(difucultad)
        expect(juego.verificarDificultad(tamaño, difucultad)).to eq 'false'    
    end

    it 'Ingreso tamaño 4 en difucultad Facil y devuelve error' do
        difucultad ="Facil"
        tamaño = 5
        juego = Juego.new()
        juego.setDificultad(difucultad)
        expect(juego.verificarDificultad(tamaño, difucultad)).to eq 'false'    
    end
    it 'Ingreso tamaño 4 en difucultad Media y devuelve error' do
        difucultad ="Media"
        tamaño = 9
        juego = Juego.new()
        juego.setDificultad(difucultad)
        expect(juego.verificarDificultad(tamaño, difucultad)).to eq 'false'    
    it 'Deberia tener false si se me acabaron los intentos' do
        codigo ="12536"
        intento ="56164"
        juego = Juego.new()
        juego.setCodigo(codigo)
        for pos in 0...9 do
            juego.intentarAdivinar(intento)
        end
        expect(juego.intentarAdivinar(intento)).to eq false 
    end
end