Dado(/^que eu tenho um usuário com o seguintes atributos:$/) do |table|
  @user = table.hashes[0]['Usuario']
  @pass = table.hashes[0]['Senha']
end

Dado(/^que eu tenho um "([^"]*)" e "([^"]*)"$/) do |_user, _pass|
   @user = _user
   @pass = _pass
end

Quando(/^faço Login$/) do
    @home = HomePage.new
    @home.load
    @home.acessar.click

    @login = LoginPage.new
    @login.with(@user, @pass)
end

Então(/^vejo a seguinte mensagem no dashboard:$/) do |_mmessage|
    @dash = DashboardPage.new
    expect(@dash.page_title.text).to eq _mmessage
end

Então(/^vejo a seguinte mensagem "([^"]*)"$/) do |_alert|
    expect(@login.alert.text).to eq _alert
end