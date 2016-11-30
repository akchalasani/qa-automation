class LoginPage
  include PageObject
  include ::SpecHandler

############ Page Objects ########################
  text_field :user_email, id: 'login_email'
  text_field :password, id: 'login_password'
  button :login, class: 'login'
  div :loged_in_user, class: 'nav-user'

################ Reusable Definitions for Login Page #####
  # def log_in(user_name, pwd)
  #   # user_email_element.wait_until
  #   # self.user_email_element.when_present
  #   sleep 2
  #   user_email = user_name
  #   sleep 2
  #   password = pwd
  #   login
  #   # self.login_element.when_present.click
  # end

  def log_in(user_name, pwd)
    user_email_element.when_present
    self.user_email = user_name
    self.password = pwd
    login
  end


end


