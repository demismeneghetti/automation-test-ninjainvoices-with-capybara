require 'capybara'
require 'capybara/dsl'
require 'capybara/rspec/matchers'
require 'selenium-webdriver'
require 'rspec'
require 'faker'
require 'site_prism'

Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, :browser => :firefox, :marionette => true)
end

World(Capybara::DSL)
World(Capybara::RSpecMatchers)
