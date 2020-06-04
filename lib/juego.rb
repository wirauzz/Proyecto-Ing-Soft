class Juego

    def initialize
        @intentosRealizados = 0
        @intento = 10
        @tamañoCodigo = 5
        @@codigo = ''
    end

    def getIntento()
        return @intento
    end 

    def getTamCodigo()
        return @tamañoCodigo
    end 

    def setIntento(intento)
        @intento = intento
    end 

    def setTamCodigo(tamCodigo)
        @tamañoCodigo = tamCodigo
    end 
    

    def getCodigo()
        return @@codigo
    end

    def setCodigo(nuevoCodigo)
        res = ''
        if(codigoValido(nuevoCodigo)) then
            @@codigo = nuevoCodigo
            return res +='codigo aceptado'
        else
            return res +='codigo no valido'
        end
    end

    def codigoValido(nuevoCodigo)
        if(nuevoCodigo != '') then
            if(soloNumeros(nuevoCodigo)) then
               if(caracteresRepetidos(nuevoCodigo)) then
                    return true
               end
           end
        end
        return false
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
            if(@@codigo.length == intento.length) then
                @vacas=0
                @toros=0
                @toros = calcularCantidadDeToros(intento, @toros)
                @vacas = calcularCantidadVacas(intento, @vacas)
                return "#{@vacas} vaca(s) y #{@toros} toro(s)"
            else
                return "las cadenas deben ser del mismo tamaño"
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


