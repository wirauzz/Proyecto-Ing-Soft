require 'juego.rb'

RSpec.describe Juego do

    it "Muestra la cantidad de intentos por defecto" do
        juego = Juego.new()
        nuevoValor = 15
        juego.setIntento(nuevoValor)
        expect(juego.getIntento()).to eq nuevoValor
    end

    it "Recibe un limite de codigo por defecto" do
        juego = Juego.new()
        expect(juego.getTamCodigo()).to eq 5
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
        expect(juego.setCodigo(codigo)).to eq 'codigo no valido razon: El codigo y el tamanio de la cadena no coiciden'    
    end

    it 'No deberia ser posible setear el siguiente codigo:1253644 ' do
        codigo = "12544"
        juego = Juego.new()
        expect(juego.setCodigo(codigo)).to eq 'codigo no valido razon: Existe un caracter repetido en el codigo'    
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

    it 'Ingreso difucultad Facil y devuelve Facil' do
        difucultad ="Facil"
        juego = Juego.new()
        juego.setDificultad(difucultad)
        expect(juego.getDificultad()).to eq 'Facil'    
    end

    it 'Ingreso difucultad Media y devuelve Media' do
        difucultad ="Medio"
        juego = Juego.new()
        juego.setDificultad(difucultad)
        expect(juego.getDificultad()).to eq 'Medio'    
    end

    it 'Ingreso difucultad Dificil y devuelve Dificil' do
        difucultad ="Dificil"
        juego = Juego.new()
        juego.setDificultad(difucultad)
        expect(juego.getDificultad()).to eq 'Dificil'    
    end

    
end
