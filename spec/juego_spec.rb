require 'juego.rb'

RSpec.describe Juego do
    it "No hace nada por el momento" do
        juego = Juego.new()
        expect(juego.generate()).to eq ''
    end
end