class GoodShopGive
  include PageObject
  include ::SpecHandler

############ Page Objects ########################

  div       :good_shop_give_logo,           class:'goodshop_give_logo'
  div       :good_shop_top_section,         class:'top_section'
  element   :support_cause_link,            class:'support-a-cause'
  element   :create_cause_link,             class:'create-a-cause'
  div       :cause_cards_section,           class:'cause-cards'
  div       :choose_cause_title,            class:'title'
  div       :search_bar,                    class:'search-bar is-navbar'
  element   :create_cause_card_link,        xpath:" .//*[@class='create-cause-card']/a"
  element   :sign_up_header,                xpath:".//*[@class='header']/div[@class='title']"
  element   :fb_login_link,                 xpath:".//*[@class='facebook-login']"




  # def verify_support_cause
    # self.support_cause_link_element.when_present.click
    # expect(@browser.url).to eq("https://uat.goodsearch.com/choosecause")
    # self.choose_cause_title_element.when_present
    # expect(self.search_bar_element.exists?).to be_truthy
    # expect(self.cause_cards_section_element.exists?).to be_truthy
    # self.create_cause_card_link_element.when_present.click
    # self.sign_up_header_element.when_present
    # expect(self.fb_login_link_element.exists?).to be_truthy
  # end


  # def verify_create_cause
  #   self.create_cause_link_element.when_present.click
  #   expect(@browser.url).to eq("https://uat.goodsearch.com/give/signup")
  #   self.sign_up_header_element.when_present
  #   expect(self.fb_login_link_element.exists?).to be_truthy
  # end



end