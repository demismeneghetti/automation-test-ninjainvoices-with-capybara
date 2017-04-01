# encoding: utf-8

Dado(/^usuario logado acessa cadastro de clientes$/) do
    steps %Q{
      Dado que eu tenho um usuário com o seguintes atributos:
          | Usuario                   | Senha  | 
          | kato.danzo@qaninja.com.br | secret | 
      Quando faço Login
    }
  @nav.customers_link.click
end

Dado(/^que eu tenho um cliente "([^"]*)"$/) do |type|
    @name = "#{Faker::Name.first_name} #{Faker::Name.last_name}"
    @phone = Faker::PhoneNumber.phone_number
    @email = Faker::Internet.free_email(@name)
    @notes = Faker::Lorem.paragraph
    @customer_type = type
end

Quando(/^faço o cadastro desse cliente$/) do
  @customer.new_button.click
  @customer.save(@name, @phone, @email, @customer_type, @notes)
end

Então(/^esse cliente é cadastrado no sistema$/) do
  @customer.search(@email)
  sleep(2) ## TODO implementar Wait For do Siteprism
  #@customer.view_content.each { |item| expect(item.text).to include @name }
  user = @customer.view_content[0].text
  expect(user).to include @name
  expect(user).to include @phone
  expect(user).to include @email
end

## Edição

Dado(/^que eu tenho um email "([^"]*)"$/) do |_email|
  @email = _email
  @name = "#{Faker::Name.first_name} #{Faker::Name.last_name}"
  @phone = Faker::PhoneNumber.phone_number
  @notes = Faker::Lorem.paragraph
end

Quando(/^faço a edição desse cliente$/) do
  @customer.click_edit(@email)
  @customer.wait_for_edit_form
  expect(@customer).to have_edit_form
  @customer.clean_fields
  @customer.edit(@name, @phone, @notes)
end

Então(/^os dados do cliente são alterados com sucesso$/) do
  @customer.get_customer(@email).click
  @customer.wait_for_details_form
  expect(@customer).to have_details_form
  expect(@customer.details_form).to have_content @name
  expect(@customer.details_form).to have_content @email
  expect(@customer.details_form).to have_content @phone
  expect(@customer.details_form).to have_content @notes
end

# Exclusão

Dado(/^que eu tenho um cliente para cadastro$/) do
   @name = "#{Faker::Name.first_name} #{Faker::Name.last_name}"
   @phone = Faker::PhoneNumber.phone_number
   @email = Faker::Internet.free_email(@name)
   @notes = Faker::Lorem.paragraph
   @customer_type = 'Gold'

   @customer.new_button.click
   @customer.save(@name, @phone, @email, @customer_type, @notes)
end

Quando(/^faço a exclusão desse cliente$/) do
  @customer.click_remove(@email)
  @customer.wait_for_modal
  @customer.confirm_button.click
end

Então(/^esse cliente não deve ser exbido na busca$/) do
  @customer.search(@email)
  expect(@customer.message_warning.text).to eq "\"#{@email}\" não encontrado."
  sleep(3)
end