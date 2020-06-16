  Given('Estoy en la pagina principal') do
    visit '/inicio'
  end
  
  Then('Presiono el boton {string} de la pantalla principal') do |string|
    click_button(string)
  end
  
  Then('elijo en el campo {string} la opcion de {string}') do |option, selector|
    all(option).last.find(:option, selector).select_option
  end
  
  Then('Presiono el boton el boton {string}') do |string|
    click_button(string)
  end

  Then("Deberia ver la dificultad {string} en la pantalla") do |string|
    last_response.body.should =~ /#{string}/m
  end
