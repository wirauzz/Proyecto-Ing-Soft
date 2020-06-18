
class Puntuaciones
    def initialize
        @puntuaciones = Array.new(10){Puntuacion.new}
    end

    def getPuntuacion(index)
        return @puntuaciones[index]
    end

    def setPuntuacion(nuevaPuntuacion, index)
        @puntuaciones[index] = nuevaPuntuacion
    end
    
    def verificarExistencia(nuevaPuntuacion)
        for i in 0.. @puntuaciones.length() -1 do
           if(@puntuaciones[i].getNombre()==nuevaPuntuacion.getNombre()) then
                return i
           end
        end
        return true
    end

    def ordenarScores()
        limit = @puntuaciones.length() -1
        for i in 0..limit do
            for j in i+1..limit do
                if ( @puntuaciones[j].getPuntuacion() < @puntuaciones[i].getPuntuacion() ) then
                        temp = @puntuaciones[i]
                        @puntuaciones[i] = @puntuaciones[j]
                        @puntuaciones[j] = temp
                end
            end
        end
    end
    

    def agregarScore(nuevaPuntuacion)
        resp = verificarExistencia(nuevaPuntuacion)
        if(resp == true) then
            @puntuaciones.push(nuevaPuntuacion)
            ordenarScores()            
            @puntuaciones.pop
            for i in 0..9 do
                puts @puntuaciones[i].getPuntuacion
                puts @puntuaciones[i].getNombre
            end
        else
            @puntuaciones[resp]=Puntuacion.new
            @puntuaciones.push(nuevaPuntuacion)
            ordenarScores()            
            @puntuaciones.pop
        end
    end
end
