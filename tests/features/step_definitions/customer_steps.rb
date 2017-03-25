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
  sleep(2)
  #@customer.view_content.each { |item| expect(item.text).to include @name }
  user = @customer.view_content[0].text
  expect(user).to include @name
  expect(user).to include @phone
  expect(user).to include @email
end