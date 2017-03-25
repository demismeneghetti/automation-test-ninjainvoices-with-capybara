# encoding: utf-8

Before do |feature|
  ## driver e URL padrao
  Capybara.configure do |config|
    config.default_driver = :selenium
    config.app_host = 'https://ninjainvoices.herokuapp.com'
  end

  ## time out
  Capybara.default_max_wait_time = 5
  ## maximixar o navegador
  Capybara.current_session.driver.browser.manage.window.maximize

  ## Page Objects (temp)
  @home = HomePage.new
  @login = LoginPage.new
  @dashboard = DashboardPage.new
  @nav = NavbarPage.new
  @customer = CustomerPage.new
end

Before('@login') do
  @login.load
  @login.with('kato.danzo@qaninja.com.br', 'secret')
end

After('@logout') do
  @nav.logout
end