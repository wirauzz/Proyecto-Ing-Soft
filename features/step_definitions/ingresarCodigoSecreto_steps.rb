Given('Lleno el campo {string} con el valor {string}') do |string, string2|
    fill_in(string, :with => string2)
end

  Given('presiono el boton de {string} que valida el codigp') do |string|
    click_button(string)
  end
  
  Given('Deberia ver la respuesta de {string} en el campo {string}') do |string, string2|
  end