class Juego
    def initialize()
        @@codigo = ''
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
end


