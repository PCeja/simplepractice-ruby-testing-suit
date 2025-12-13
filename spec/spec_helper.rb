require 'capybara/rspec'
require 'selenium-webdriver'
require 'site_prism'
require 'dotenv'
require 'faker'
require 'capybara/sessionkeeper'
require 'support/pages/login_page'

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

# Session file with persisted cookies
SESSION_FILE = 'tmp/session.cookies'
SESSION_MAX_AGE_HOURS = 12  # Re-login after this many hours

def session_valid?
    return false unless File.exist?(SESSION_FILE)

    # Check if session file is still fresh
    file_age_hours = (Time.now - File.mtime(SESSION_FILE)) / 3600
    if file_age_hours > SESSION_MAX_AGE_HOURS
        puts "⚠ Session expired (#{file_age_hours.round(1)} hours old)"
        File.delete(SESSION_FILE)
        return false
    end

    true
end

RSpec.configure do |config|
    config.include Capybara::DSL
    config.formatter = :documentation

    # Login once per test suite execution and save session cookies
    config.before(:suite) do
        # Ensure tmp directory exists
        FileUtils.mkdir_p('tmp')

        # Only login if we don't have a valid session file
        unless session_valid?
            Capybara.using_session(:login_session) do
                session = Capybara.current_session
                login_page = LoginPage.new
                login_page.load
                login_page.login(ENV['EMAIL'], ENV['PASSWORD'])

                # Save session to file using sessionkeeper
                session.save_cookies(SESSION_FILE)
                puts "✓ Session saved to #{SESSION_FILE}"

                # Close the login browser window
                session.driver.quit
            end
        else
            puts "✓ Using existing session from #{SESSION_FILE}"
        end
    end

    # Restore session cookies before each test
    config.before(:each) do
        session = Capybara.current_session
        # Visit favicon to establish domain without loading full login page
        session.visit('/favicon.ico')
        session.restore_cookies(SESSION_FILE)
    end
end
