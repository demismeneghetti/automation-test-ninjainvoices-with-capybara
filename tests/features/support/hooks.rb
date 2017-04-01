# encoding: utf-8
require 'fileutils'

Before do |feature|
  ## driver e URL padrao
  Capybara.configure do |config|
    config.default_driver = :selenium
    config.app_host = 'https://ninjainvoices.herokuapp.com'
  end

  ## time out
  Capybara.default_max_wait_time = 5
  ## maximixar o navegador
  #Capybara.current_session.driver.browser.manage.window.maximize

  ## Page Objects (temp)
  @home = HomePage.new
  @login = LoginPage.new
  @dashboard = DashboardPage.new
  @nav = NavbarPage.new
  @customer = CustomerPage.new
end

Before('@save_for_remove') do
   @name = "#{Faker::Name.first_name} #{Faker::Name.last_name}"
   @phone = Faker::PhoneNumber.phone_number
   @email = Faker::Internet.free_email(@name)
   @notes = Faker::Lorem.paragraph
   tipos = ['Gold','Prime','Exclusivo', 'Platinum']

   @customer_type = tipos.sample

   @customer.new_button.click
   @customer.save(@name, @phone, @email, @customer_type, @notes)
end

Before('@login') do
  @login.load
  @login.with('kato.danzo@qaninja.com.br', 'secret')
end

After('@logout') do
  @nav.logout
end

After do |scenario|
  file = scenario.name.gsub(/\s+/, '_').tr('/', '_')
  path = 'reports/screenshots/'
  screenshot = path + file.downcase + '.png'
  page.save_screenshot(screenshot)
  embed(screenshot, 'image/png', 'SCREENSHOT')
end