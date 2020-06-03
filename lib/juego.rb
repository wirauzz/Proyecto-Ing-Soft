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
            return 'codigo aceptado'
        else
            return 'codigo no valido'
        end
    end

    def codigoValido(nuevoCodigo)
        if(soloNumeros(nuevoCodigo)) then
           if(caracteresRepetidos(nuevoCodigo)) then
                return true
           end
        end
        return false
    end

    def soloNumeros(nuevoCodigo)
        return nuevoCodigo.scan(/\D/).empty?
    end

    def caracteresRepetidos(nuevoCodigo)
        if nuevoCodigo =~ /(.)\1/ then
            return false
          else
            return true
          end
    end
    






    
    
end


