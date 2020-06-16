Given('presiono el boton regresar al inicio {string}') do |string|
    visit '/inicio'
  end
  
  Given('presiono el boton {string} de ver puntuaciones') do |string|
    visit '/scores'
  end
  
  Then('deberia veria ver {string}') do |string|
    last_response.body.should =~ /#{string}/m
  end