require 'set'

class Jugador
    def initialize
        @@Nombre = 'Invitado'
    end

    def getNombre()
        return @@Nombre
    end

    def setNombre(nuevoNombre)
        @@Nombre = nuevoNombre
    end
end
