Given("visito la pagina principal") do
    visit '/'
end

Then("deberia ver {string}") do |text|
  last_response.body.should =~ /#{text}/m
end

Given("Lleno la cantidad de autos con {string} en {string}") do |valor, campo|
  fill_in(campo, :with => valor)
end 

When ("Presiono el boton {string}")do |boton|
    click_button(boton)
  end