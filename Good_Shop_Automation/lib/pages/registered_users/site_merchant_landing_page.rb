class SiteMerchantLanding
  include PageObject
  include ::SpecHandler

############ Page Objects ########################
  element      :merchant_logo,               xpath: "//div[@class='logo-container']"
  element      :merchant_landing_header,     xpath: "//div[@class='merchant-landing-header']/h1"
  element      :cause_logo,                  xpath: "//div[@class='cause-logo-container']"
  element      :cause_header,                xpath: "//div[@class='cause-info']/div"
  divs         :all_coupons_badge,           xpath: ".//div[@id='main']//div//li"
  # element      :email_sign_up,               xpath:".//*[@id='global-masthead']//div[2]/a"
  divs         :sign_up_choose_cause,        xpath:".//*[@class='cause-list']/li"
  div          :good_search_give_visitor,    class: 'goodshop_give_logo'




######## filters - section ###########################
  element      :all_coupons_status,          css:   ".all-coupons.selected"
  element      :promo_codes,                 css:   ".promo-codes"
  element      :deals,                       xpath: ".//div[@class='filters']//a[4]"

######## member-with-cause - section ###########################
  element     :cause_info_details,           xpath: '//div[@class="cause-info"]//a[1]'
  element     :shop_at_link,                 xpath: '//div[@class="cause-info"]//a[2]'
  element     :learn_more,                   xpath: './/div[@class="media-info-box heart "]//a'
  element     :donation_details,             xpath: './/div[@id="donation-details"]/div'



######## We donate - section ###########################
  element      :we_donate,                    xpath: ".//div[@class='member-without-cause']"

  element      :choose_cause_link,            css: '.member-without-cause>a'

  element      :popular_stores_title,         xpath: ".//*[@id='sidebar']//div/h2[contains(text(),'Popular Stores')]"
  divs         :popular_stores_links,         xpath: ".//*[@id='sidebar']//div[3]//div/a"
  element      :popular_store_link,           xpath: ".//*[@id='sidebar']//div[3]//div/a[1]"

  element      :related_stores_title,         xpath: ".//*[@id='sidebar']//div/h2[contains(text(),'Related Stores')]"
  divs         :related_stores_links,         xpath: ".//*[@id='sidebar']//div[4]//div/a"
  element      :related_store_link,           xpath: ".//*[@id='sidebar']//div[4]//div/a[1]"

  element      :deals_discounts_title,        xpath: ".//*[@id='sidebar']//div/h2[contains(text(),'Deals & Discounts')]"
  divs         :deals_discounts_links,        xpath: ".//*[@id='sidebar']//div[5]//div/a"
  element      :deals_discounts_link,         xpath: ".//*[@id='sidebar']//div[5]//div/a[1]"

  element      :ios_app_title,                xpath: ".//*[@class='mobile-app-ad']/p"
  element      :get_app_link,                 xpath: ".//*[@class='mobile-app-ad']/a"

######## member-with out-cause - section ###########################
  element      :rating_star,                  css: "span[class='stars']"

  element      :add_comment,                  xpath: './/*[@id="main"]//div//li[2]//div[@class="comment-header-container"]'

  textarea      :add_comment_text_field,       xpath: "html/body//div/ul/li[2]//div/form/div[2]/textarea"


  element       :btn_post,                    css: '.enabled'

  element       :msg_success,                 xpath: './/*[@class="comments"]//div[@class="success"]'

  element       :coupon_badge,                xpath: './/*[@id="main"]/div[1]/ul/li[2]//strong/span'


########   Model Popup  ################
  div             :deal_sale_model_popup,       xpath: "html/body//div[@class='deal-modal no-code']"
  element         :popup_header,                xpath: "html/body//div[@class='section top']/span"
  element         :email_signup_header,         xpath: "html/body//div[@class='section bottom']/li/h2"
  element         :email_signup_text,           xpath: "html/body//div[@class='section bottom']/li/p"
  text_field      :email_text_field,            xpath: "html/body//div/li/form//div/input[@id='user_email']"
  element         :btn_sign_me_up,              xpath: "html/body/div[3]/div[2]/div[1]/div[3]/li/form/button"
  element         :msg_signup_success,          xpath: "html/body/div[3]/div[2]//div[@class='title']"
  element         :pop_up_close,                xpath: "html/body//div[@class='vex-close']"


  element         :no_code_needed,              xpath: "html/body//div[@class='section middle']/span"
  element         :shop_at_merchant,            xpath: "html/body//div[@class='section middle']/a[1]"

  div             :coupon_code_model_popup,     xpath: "html/body//div[@class='deal-modal']"
  element         :copy_code,                   xpath: "html/body//div[@class='code-button']/a"
  element         :code_text,                   xpath: "html/body//div[@class='code-button']/span"


  divs            :coupons_badge_list,          xpath: ".//*[@id='main']/div[1]/ul/li"


  element      :breadcrumbs_section_tabs,            xpath: "//*[@id='main']/div[@class='breadcrumbs']"

  element      :breadcrumbs_tabs_parted,             xpath: "//*[@id='main']/div[@class='breadcrumbs']/a"

  element      :breadcrumbs_tab_home,                xpath: "//*[@id='main']/div[@class='breadcrumbs']/a[1]"


                                #######About Section############

  element      :about_section,                       xpath: "//*[@id='main']//div[@class='deals']/div"

  element      :about_orbitz_deals,                  xpath: "//*[@id='main']//div[@class='deals']/div/h2"

  element      :about_orbitz_deals_copy,             xpath: "//*[@id='main']//div[@class='deals']//div[@class='copy']"


                                ###### Temporary sticky notes #######

  element      :large_image,                          xpath: ".//*[@id='main-content']//div[@class='large-image']"


                                ########## Footer links ##########

  element      :footer_link_GS,                        xpath: "//*[@id='main-content']//div[@id='footer']"

  element      :footer_link_about_GS,                  xpath: "//*[@id='main-content']//div[@class='about-goodshop']"

  element      :footer_link_about_GS_parted,           xpath: "//*[@id='main-content']//div[@class='about-goodshop']/a"

  element      :footer_link_GS_aboutUs,                xpath: "//*[@id='main-content']//div[@class='about-goodshop']/a[1]"

  element      :footer_contactUs,                      xpath: "//*[@id='main-content']//div[@class='about-goodshop']/a[7]"


############# About Us page ###############
  element      :about_us_header,                       xpath: ".//*[@id='main-content']/div[2]/div[1]/h1"
  element      :causes_header,                         xpath: ".//*[@class='static']//h1"
  element      :choose_cause_header,                   xpath: ".//*[@class='title']"
  element      :spread_the_word,                       xpath:".//*[@id='main-content']/div[2]"
  div          :add_cause_page,                        class: 'charity-types'
  div          :good_shop_app,                         class: 'app-preview'
  div          :good_serch_header,                     class: 'logo new'
  div          :travel_deal,                           class: 'featured-travel-deal'
  element      :grocery_coupons,                       xpath: ".//h1[@class='grocery-title']"







                              ############# Causes in footer ###############

  element        :footer_link_causes,                    xpath: "//*[@id='main-content']//div[@class='causes']"

  element        :footer_link_causes_parted,             xpath: "//*[@id='main-content']//div[@class='causes']/a"

  element        :footer_link_causes_firstL,             xpath: "//*[@id='main-content']//div[@class='causes']/a[1]"

  element        :footer_link_causes_secondL,            xpath: "//*[@id='main-content']//div[@class='causes']/a[2]"

  element        :footer_link_causes_thirdL,             xpath: "//*[@id='main-content']//div[@class='causes']/a[3]"

  element        :footer_link_causes_fourthL,            xpath: "//*[@id='main-content']//div[@class='causes']/a[4]"


                                ############# Raise in footer ###############

  element        :footer_link_raise,                   xpath: "//*[@id='main-content']//div[@class='ways-to-raise']"

  element        :footer_link_raise_parted,            xpath: "//*[@id='main-content']//div[@class='ways-to-raise']/a"

  element        :footer_link_raise_firstL,            xpath: "//*[@id='main-content']//div[@class='ways-to-raise']/a[1]"

  element        :footer_link_raise_thirdL,            xpath: "//*[@id='main-content']//div[@class='ways-to-raise']/a[3]"

  element        :footer_link_raise_fourthL,           xpath: "//*[@id='main-content']//div[@class='ways-to-raise']/a[4]"

  element        :footer_link_raise_sixthL,            xpath: "//*[@id='main-content']//div[@class='ways-to-raise']/a[6]"


                                  ######Social Media Section#######

  element      :social_media_links,                  xpath: "//*[@id='main-content']//div[@class='social']"

  element      :social_media_single_link,            xpath: "//*[@id='main-content']//div[@class='social']/a"

##################################  page load objects ################################
  element          :merchant_landing_page,           xpath: ".//*[@id='main']/div[1]/ul"


################################coupon submit##########################################
  div            :submit_coupon_section,      id:'new_deal'
  element        :coupon_section_heading,     xpath: ".//*[@id='new_deal']/div[3]"
  text_area      :coupon_description,         id: 'deal_deal_text'
  text_field     :coupon_code,                id: 'deal_deal_couponcode'
  text_field     :expiration,                 id: 'deal_deal_end'
  button         :submit_button,              xpath:".//*[@id='new_deal']//div[@class='actions']/button"
  element        :success_msg,                xpath: ".//*[@id='new_deal']/div[9]/span"
  div            :captcha,                    id:'recaptcha_area'


################ Reusable Definitions for Login Page ##################################

  def submit_coupon_section(description,c_code)
    coupon_description_element.when_present
    self.coupon_description = description
    coupon_code_element.when_present
    self.coupon_code = c_code
    self.expiration = Time.now().strftime("%m/%d/%y")
    submit_button_element.when_present.click
    success_msg_element.when_present
    fail'Submit Coupon success message is not displayed' if !(self.success_msg_element.when_present.text == "Thanks for submitting a coupon! It should appear on the site within 24 hours.")
  end


 # def cause_links
 #   cause_links=[]
 #   @browser.elements(:xpath, ".//*[@class='causes']/a").each do |e|
 #     cause_links << e.text
 #   end
 #   for i in 1..cause_links.size
 #     @browser.element(:xpath, ".//*[@class='causes']/a[#{i}]").when_present.click
 #     if @browser.url.include? "uat"
 #       puts"$cause_uat:#{$arr_uat[i]}"
 #       expect(@browser.url).to eq($arr_uat[i])
 #     else
 #       expect(@browser.url).to eq('https://www.goodsearch.com/causes')
 #     end
 #     @browser.back
 #   end
 # end

  # def page_initialize
  #   until @browser.div(:id=>"some_div").exists? do sleep 1 end
  # end

  # def page_initialize
  #   # super
  #   until @browser.div(:id=>"main").exists? do sleep 1 end
  # end

  # def page_initialize(variable_name)
  #   puts"#{variable_name}"
  #   count = 1
  #   until !("#{variable_name}_element".exists?) do
  #     puts"#{count}"
  #     sleep 1
  #     fail "#{variable_name} - is not visible until 10 seconds" if count == 10
  #     count+=1
  #   end
  # end


  # def page_initialize
  #   sleep 4
  #   puts"#{merchant_landing_page}_element" if merchant_landing_page.present?
  #   count = 1
  #   until (merchant_landing_page_element.exists?) do
  #      puts"#{count}"
  #      sleep 1
  #      fail "#{merchant_landing_page_element} - is not visible until 10 seconds" if count == 10
  #      count+=1
  #   end
  # end




  def add_comment_section(comment_txt)
    p comment_txt
    self.add_comment_element.when_present.click
    self.add_comment_text_field_element.when_present
    self.add_comment_text_field = comment_txt
    self.btn_post_element.when_present.click
    puts self.captcha_element.exists?
    # Ignoring the post success verification if captcha presents
    if !(self.captcha_element.exists?)
      puts"post success msg:#{msg_success_element.when_present.text}"
      raise"!!!!Post comment success message is displaying as #{msg_success_element.when_present.text}, message displayed is not as expected" if !(msg_success_element.when_present.text == "Thanks for helping others by submitting a comment!")
    end
  end


end