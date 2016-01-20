require 'capybara/rspec'
require 'capybara/webkit'

Capybara.configure do |config|
  config.default_driver = :webkit
  config.match = :prefer_exact
end
