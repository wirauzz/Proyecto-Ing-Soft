
class Juego

    def initialize
        @@intentosRealizados = 1
        @@intentosDisponibles = 15
        @@tamanoCodigo = 5
        @@codigo = ''
        @@dificultad = 'Medio'
    end

    def getIntento()
        return @@intentosDisponibles
    end

    def getDificultad()
        return @@dificultad
    end

    def getIntentosRealizados()
        return @@intentosRealizados
    end

    def getTamCodigo()
        return @@tamanoCodigo
    end 
    
    def getCodigo()
        return @@codigo
    end

    def setIntento(intento)
        @@intentosDisponibles = intento
    end 

    def setDificultad(dificultad)
        case dificultad
            when 'Facil'
                @@intentosDisponibles = 10
                @@tamanoCodigo = 3
            when 'Medio'
                @@intentosDisponibles = 15
                @@tamanoCodigo = 5
            when 'Dificil'
                @@intentosDisponibles = 20
                @@tamanoCodigo = 8
        end
        @@dificultad=dificultad
    end

    def setCodigo(nuevoCodigo)
        res = ''
        if(codigoValido(nuevoCodigo) == true) then
            @@codigo = nuevoCodigo
            return res +='codigo aceptado'
        else
            return res +='codigo no valido razon: ' + codigoValido(nuevoCodigo)
        end
    end

    def setTamCodigo(tamCodigo)
        if(tamCodigo != @@tamanoCodigo) then
            @@tamanoCodigo = tamCodigo
            @@codigo.clear
        end
    end 

    def generarCodigoAleatorio()
        @@codigo = [*0..9].sample(@@tamanoCodigo).join('')
        return "codgio aleatorio genereado"
    end


    def resetGame()
        @@intentosRealizados =1
        @@codigo.clear
    end


    def codigoValido(nuevoCodigo)
        if(nuevoCodigo != '') then
            if(verificarTamano(nuevoCodigo)) then
                if(soloNumeros(nuevoCodigo)) then
                    if(caracteresRepetidos(nuevoCodigo)) then
                        return true
                    else
                        return "Existe un caracter repetido en el codigo"
                    end
                else
                    return "Existe un caracter en el codigo que no es un numero"
                end
            else
                return "El codigo y el tamanio de la cadena no coiciden"
            end
        else
            return "El codigo esta vacio"
        end
    end


    def verificarTamano(nuevoCodigo)
        if(nuevoCodigo.length!=@@tamanoCodigo) then
            return false
        else
            return true
        end
    end


    def soloNumeros(nuevoCodigo)
        return nuevoCodigo.scan(/\D/).empty?
    end

    
    def caracteresRepetidos(nuevoCodigo)
        nuevoCodigo.downcase.each_char.with_object('') { |c,s|
            c =~ /[0-9]/ && s.include?(c) ? (return false) : s << c }
          true
    end

    def intentarAdivinar(intento)
        if(soloNumeros(intento)) then
            if(@@tamanoCodigo == intento.length) then
                @vacas=0
                @toros=0
                @toros = calcularCantidadDeToros(intento, @toros)
                if(@toros == intento.length)
                    return true
                else
                    @@intentosRealizados += 1
                    if(@@intentosRealizados >= @@intentosDisponibles) then
                        return false
                    else
                        @vacas = calcularCantidadVacas(intento, @vacas)
                        return "#{@vacas} vaca(s) y #{@toros} toro(s)"
                    end
                end

            else
                return "las cadenas deben ser del mismo tamanio"
            end
        else
            return "la cadena debe solo contener numeros"
        end
    end

    def calcularCantidadVacas(intento, vacas)
        for pos in 0...intento.length do
            for index in 0...intento.length do
                if(intento[pos] == @@codigo[index] && pos!=index)
                    vacas +=1
                end
            end
        end
        return vacas
    end

    def calcularCantidadDeToros(intento, toros)
        for pos in 0...intento.length
            if(intento[pos] == @@codigo[pos]) then
                toros +=1
            end
        end
        return toros
    end
end


