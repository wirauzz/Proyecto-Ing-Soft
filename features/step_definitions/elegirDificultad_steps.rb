  Given('Estoy en la pagina principal') do
    visit '/inicio'
  end
  
  Given('Presiono el boton {string} de la pantalla principal') do |string|
    click_button(string)
  end
  
  Given('elijo en el campo {string} la opcion de {string}') do |option, selector|
    all(option).last.find(:option, selector).select_option
  end
  
  Given('Presiono el boton el boton {string}') do |string|
    click_button(string)
  end

  Then("Deberia ver la dificultad {string} en la pantalla") do |string|
    last_response.body.should =~ /#{string}/m
  end
