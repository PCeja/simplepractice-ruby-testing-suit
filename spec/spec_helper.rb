require 'capybara/rspec'
require 'selenium-webdriver'
require 'site_prism'
require 'dotenv'
require 'faker'

Dotenv.load

Capybara.register_driver :chrome do |app|
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--window-size=1920,1080')
    options.add_argument('--headless') if ENV['HEADLESS'] == 'true'

    Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.default_driver = :chrome
Capybara.default_max_wait_time = 10
Capybara.app_host = ENV['BASE_URL']

RSpec.configure do |config|
    config.include Capybara::DSL
    config.formatter = :documentation
end
