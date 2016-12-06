class GoodShopHome
  include PageObject
  include ::SpecHandler

############ Page Objects ########################

  element           :sign_in,               xpath: ".//*[@id='global-masthead']//div[@class='sign-in']/a"
  element           :msg_flash_notice,      xpath: ".//*[@id='main-content']//div[@class='flash notice page']/p"
  element           :cause_choosen,         xpath: ".//*[@id='user-stats']//div[@class='info-container']"
  div               :good_search_logo,      class: "logo new"
  element           :signin_user,           xpath: ".//*[@class='nav-user']/span[1]"

################ Reusable Definitions for Login Page ##############
  def click_signin;    self.sign_in_element.when_present.click  end



end