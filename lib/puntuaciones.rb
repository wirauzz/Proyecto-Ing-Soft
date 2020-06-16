
class Puntuaciones
    def initialize
        @puntuaciones = Array.new(10){Puntuacion.new}
    end

    def getPuntuaciones()
        return @puntuaciones
    end

    def getPuntuacion(index)
        return @puntuaciones[index]
    end

    def setPuntuacion(nuevaPuntuacion, index)
        @puntuaciones[index] = nuevaPuntuacion
    end
    
    def agregarScore(nuevaPuntuacion)
        for i in 0..9 do
            if(@puntuaciones[i].getPuntuacion() >= nuevaPuntuacion.getPuntuacion()) then
                @puntuaciones[i] = nuevaPuntuacion
                break
            end
        end        
    end
    
    
end
