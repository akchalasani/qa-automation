class VisitorsGoodShopHome
  include PageObject
  include ::SpecHandler

############ Page Objects ########################

  element           :more_categories_link,               xpath: ".//div[contains(@class, 'more-categories desktop-link')]"
  element           :travel_dropdown_links,              xpath: ".//div[contains(@class, 'travel-deals with-dropdown')]//li"
  element           :local_dropdown_links,               class: 'double-wide'
  element           :grocery_dropdown_links,             xpath: ".//*[@class='double-wide end-aligned']/li"
  # element           :goodshop_give,                      xpath: ".//div[contains(@class, 'goodshop-give')]"



################ Reusable Definitions for Login Page ##############
  # def click_goodshop_give_menu
  #   self.goodshop_give_element.when_present.click
  # end

end