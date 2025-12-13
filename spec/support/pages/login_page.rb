require_relative 'base_page'

class LoginPage < BasePage
  set_url '/'

  element :email_input, '#user_email'
  element :password_input, '#user_password'
  element :signin_button, '#submitBtn'

  # Login method -> Initially implemented to login for each test
  # Currently instead of logging in for each test, we are using cookies to persist the session
  # From now on, this can be used to verify login related scenarios
  def login(email, password)
    email_input.set(email)
    password_input.set(password)
    signin_button.click

    # Wait for login to complete (uses Capybara.default_max_wait_time as max)
    page.has_css?('.left-nav')
  end
end
