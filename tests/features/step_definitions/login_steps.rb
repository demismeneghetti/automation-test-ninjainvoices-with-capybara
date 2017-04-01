# encoding: utf-8

Dado(/^que eu tenho um usuário com o seguintes atributos:$/) do |table|
  @user = table.hashes[0]['Usuario']
  @password = table.hashes[0]['Senha']
end

Dado(/^que eu tenho um "([^"]*)" e "([^"]*)"$/) do |user, pwd|
  @user = user
  @password = pwd
end

Quando(/^faço Login$/) do
  @home.load
  @home.login.click
  @login.with(@user, @password)
end

Então(/^vejo a seguinte mensagem no dashboard:$/) do |message|
  expect(@dashboard.message_welcome.text).to eq message
end

Então(/^vejo a seguinte mensagem "([^"]*)"$/) do |message|
  expect(@login.message_warning.text).to eq message
end