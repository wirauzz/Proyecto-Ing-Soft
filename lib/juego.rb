class Juego
    @@codigo = ''

    def initialize()
    end

    def getCodigo()
        return @@codigo
    end

    def setCodigo(nuevoCodigo)
        if(codigoValido(nuevoCodigo)) then
            @@codigo = nuevoCodigo
        else
            return 'codigo no valido'
        end
    end

    def codigoValido(nuevoCodigo)

        if(soloNumeros(nuevoCodigo)) then
            return true    
        end
        return false
    end

    def soloNumeros(nuevoCodigo)
        return nuevoCodigo.scan(/\D/).empty?
    end

    def caracteresRepetidos(nuevoCodigo)
        return true
    end
    






    
    
end


