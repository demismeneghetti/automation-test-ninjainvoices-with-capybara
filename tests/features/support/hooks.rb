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

end
