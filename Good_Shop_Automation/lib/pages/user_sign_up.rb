class UserSignUp
  include PageObject
  include ::SpecHandler

  ################Page objects for sign up##################
  element     :join_now,     xpath: "//*[@id='main-content']/div[2]/div/section/p[1]/a"
  text_field  :user_fname,   xpath: "//*[@id='user_fname']"
  text_field  :user_lname,   xpath: "//*[@id='user_lname']"
  text_field  :user_remail,  id:    'user_email'
  text_field  :user_rpwd,    id:    'user_pwd'
  element     :sign_me_up,   xpath: "//*[@id='new_user']/fieldset/div[6]/button"


  def sign_me(fname, lname, uemail,upwd)
    user_fname_element.when_present
    self.user_fname = fname
    self.user_lname = lname
    self.user_remail = uemail
    self.user_rpwd = upwd
    sign_me_up_element.click
  end

end