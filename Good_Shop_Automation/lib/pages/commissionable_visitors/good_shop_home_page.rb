class VisitorsGoodShopHome
  include PageObject
  include ::SpecHandler

############ Page Objects ########################

  element           :more_categories_link,               xpath: ".//div[contains(@class, 'more-categories desktop-link')]"
  element           :travel_dropdown_links,              xpath: ".//div[contains(@class, 'travel-deals with-dropdown')]//li"
  element           :local_dropdown_links,               class: 'double-wide'



  # .//*[@class='double-wide']/li

################ Reusable Definitions for Login Page ##############
  # def click_categories(link)
  #   self.+ "#{link}"+_elemenr.wait_until_present.click
  # end
  #
# def click_local_menu
#   self.local_menu_element.when_present.click
# end

end