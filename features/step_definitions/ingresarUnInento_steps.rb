Given('Presiono el boton {string} que me lleva a la ventana de adivinar el codigo') do |string|
    click_button(string)
  end
  
  Given('Lleno en el campo de {string} el valor de {string}') do |string, string2|
    fill_in(string, :with => string2)
  end
  
  Then('Deberia ver en el campo {string} {string}') do |string, string2|
    
  end