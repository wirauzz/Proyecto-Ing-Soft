Given('Estoy en la pagina de bienvenida') do
  visit '/'
end

When('lleno el campo {string} con {string}') do |string, string2|
  fill_in(string, :with => string2)
end

When('presiono el boton {string}') do |string|
  click_button(string)
end

Then('Deberia ver {string} en la pantalla') do |string|
  last_response.body.should =~ /#{string}/m
end