require 'capybara/rspec'
require 'capybara/rails'
require 'capybara/poltergeist'

RSpec.configure do |_config|
  Capybara.javascript_driver = :poltergeist
end
