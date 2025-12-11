require_relative 'base_page'

class LoginPage < BasePage
  set_url '/'

  element :email_input, '#user_email'
  element :password_input, '#user_password'
  element :signin_button, '#submitBtn'

  def login(email, password)
    email_input.set(email)
    password_input.set(password)
    signin_button.click
  end
end
