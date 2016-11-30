And(/^I verify the site merchant landing page with all the details$/) do
  #######click on merchant logo and verify###########
  on(SiteMerchantLanding) do |obj|
    #################verify submit coupon###########################
    counter = 1
    until obj.submit_coupon_section_element.exists? do
      sleep 1
      if obj.submit_coupon_section_element.exists?
        puts"counter:#{counter}"
        expect(obj.coupon_section_heading_element.when_present.text).to eq('Please submit a coupon')
        obj.submit_coupon_section('chrs1','christmas offer')
        break
      end
      break if counter.equal? 3
      counter+=1
    end

    obj.merchant_logo_element.when_present.click
    obj.verifyNewTabs
    # puts"new_url:#{$new_wind_url}"
    #Below line needs to validate
    fail "https://#{$link1}.com : is not opened" if $new_wind_url.include? "https://#{$link1}.com"

    expect(obj.merchant_landing_header_element.exists?).to be_truthy
    obj.cause_logo_element.when_present if !(obj.email_sign_up_element.exists?)
    expect(obj.cause_logo_element.exists?).to be_truthy if !(obj.email_sign_up_element.exists?)

# verifying the coupons and the deals which are present under All Coupons tab
    coupons = []
    obj.all_coupons_status_element.exists?
    obj.all_coupons_badge_elements.each do |e|
      coupons << e.text
      puts"test:#{e.text}"
    end
    puts "size:#{coupons.size}"
    fail "No coupons present under all coupons filter"  if !(coupons.size.to_i > 1)

# verifying the coupons and the deals which are present under promo code filter
    #Sleep 1
    obj.promo_codes_element.click
    #Sleep 1
    coupons = []
    obj.all_coupons_badge_elements.each do |e|
      coupons << e.text
      puts"test:#{e.text}"
    end
    puts "size:#{coupons.size}"
    fail "No coupons present under all coupons filter"  if !(coupons.size.to_i > 1)

# verifying the coupons and the deals which are present under Deals filter
    #Sleep 1
    obj.deals_element.click
    #Sleep 1
    coupons = []
    obj.all_coupons_badge_elements.each do |e|
      coupons << e.text
      puts"test:#{e.text}"
    end
    puts "size:#{coupons.size}"
    fail "No coupons present under all coupons filter"  if !(coupons.size.to_i > 1)


    ########Verify we donate section
    expect(obj.we_donate_element.exists?).to be_truthy
    obj.choose_cause_link_element.click
    sleep 2
    if @browser.url.include? "uat"
      # if obj.email_sign_up_element.exists?
      #   fail"expected url:#{@browser.url} is not included 'https://uat.goodsearch.com/choosecause'" if @browser.url.include? 'https://uat.goodsearch.com/choosecause'
      # else
        expect(@browser.url).to eq("https://uat.goodsearch.com/choosecause")
      # end
    else
      expect(@browser.url).to eq("https://www.goodsearch.com/choosecause")
    end
    #Sleep 2
    @browser.back

    #Sleep 2
    puts @browser.url

    #################################

    expect(obj.popular_stores_title_element.exists?).to be_truthy
    links = []
    obj.popular_stores_links_elements.each do |e|
       if e.visible?
         puts"links:#{e.text}"
         links << e.text
       end
    end

    fail "No links present under Coupons from Popular Stores"  if !(links.size.to_i > 1)

    ##########clicking on first link
    obj.popular_store_link_element.click
    puts @browser.url
    fail"Current url opened doesn't contains: #{links[0]}" if @browser.url.include? links[0].to_s
    @browser.back

    #################################
    obj.related_stores_title_element.when_present
    expect(obj.related_stores_title_element.exists?).to be_truthy
    links = []
    obj.related_stores_links_elements.each do |e|
      if e.visible?
        puts"links:#{e.text}"
        links << e.text
      end
    end

    fail "No links present under Coupons from Popular Stores"  if !(links.size.to_i > 1)

    ##########clicking on first link
    obj.related_store_link_element.click
    puts @browser.url
    fail"Current url opened doesn't contains: #{links[0]}" if @browser.url.include? links[0].to_s
    @browser.back

    ######################################
    # obj.deals_discounts_title_element.when_present
    expect(obj.deals_discounts_title_element.exists?).to be_truthy
    links = []
    obj.deals_discounts_links_elements.each do |e|
      if e.visible?
        puts"links:#{e.text}"
        links << e.text
      end
    end

    fail "No links present under Coupons from Popular Stores"  if !(links.size.to_i > 1)

    ##########clicking on link
    obj.deals_discounts_link_element.when_present.click
    puts @browser.url
    fail"Current url opened doesn't contains: #{links[0]}" if @browser.url.include? links[0].to_s
    @browser.back

    ########################################
    if obj.ios_app_title_element.exists?
      fail "!!!Expected iOS app title is not displayed" if !(obj.ios_app_title_element.when_present.text == "Shop, save, and give with our new iOS app!")
    end
    # expect(obj.ios_app_title_element.text).to eq("Shop, save, and give with our new iOS app!")
    expect(obj.get_app_link_element.exists?).to be_truthy if obj.get_app_link_element.when_present
  end
end


And(/^I update the star ratings by clicking on it and login through emailid or facebook$/) do
  on(SiteMerchantLanding) do |obj|
    # obj.page_initialize(".//*[@id='sidebar']/div[1]/div[1]/div/div[1]/div[1]")
    obj.rating_star_element.when_present.click
    on(LoginPage) do |page|
      page.log_in($user_email,$user_pwd)
    end
    #Sleep 5
    title = ["Poor","Fair","Good", "Very Good","Excellent"]
    a=[]
    j=0
    for i in 1..5
      p title[i]
      @browser.element(:xpath => ".//*[@class='stars']/img[#{i}").when_present
      # sleep 4
      if @browser.element(:xpath => ".//*[@class='stars']/img[#{i}]").present?
        fail "Star selected and the title displayed for the same are not matching" if !(@browser.element(:xpath => ".//*[@class='stars']/img[#{i}]").title == "#{title[j]}")
      end
      # fail "Star selected and the title displayed for the same are not matching" if !(@browser.element(:xpath => ".//*[@class='stars']/img[#{i}]").title == "#{title[j]}")
      #Sleep 1
      @browser.element(:xpath => ".//*[@class='stars']/img[#{i}]").when_present.click
      #Sleep 3
      a << @browser.element(:xpath => ".//*[@class='bottom']//span[1]").text  +  @browser.element(:xpath => ".//*[@class='bottom']//span[2]").text
      #Sleep 1
      j+=1
    end
    puts"a:#{a}"
  end
end

Then(/^I verify shop button and details link functionality uner merchant landing page$/) do
  on(SiteMerchantLanding) do |obj|
    obj.cause_info_details_element.click
    #Sleep 2
    expect(obj.donation_details_element.exists?).to be_truthy
    expect(obj.learn_more_element.exists?).to be_truthy
    obj.learn_more_element.click
    sleep 4
    if @browser.url.include? "uat"
      expect(@browser.url).to eq("https://uat.goodsearch.com/terms#donation_details")
    else
      expect(@browser.url).to eq("https://www.goodsearch.com/terms#donation_details")
    end
    sleep 2
    @browser.back
    #Sleep 2
    puts @browser.url

    #########Click on Shop at link############
    obj.shop_at_link_element.click
    #Sleep 5
    obj.verifyNewTabs
    puts"new_url:#{$new_wind_url}"
    link_text = $link1.downcase.gsub(" ", "").gsub("'","")
    puts"link_text:#{link_text}"
    fail "https://#{link_text}.com : is not opened" if !($new_wind_url.include? "https://www.#{link_text}.com")
    #Sleep 3
  end
end

And(/^I verify the content present on coupon box$/) do
  on(SiteMerchantLanding) do |page|
    for i in 2..5
      #Coupon_Badge:
      coupon_badge_text = @browser.element(:xpath => ".//*[@id='main']/div[1]/ul/li[#{i}]//strong/span").when_present.text
      puts"coupon_badge_text:#{coupon_badge_text}"
      fail"coupon_badge_text is not present for #{i}th list item" if coupon_badge_text.empty?
      expect(@browser.element(:xpath, ".//*[@id='main']//div//li[#{i}]//a").exists?).to be_truthy

      #Sale: or Code:
      expect(@browser.element(:xpath, ".//*[@id='main']/div[1]/ul/li[#{i}]//div[contains(@class, 'detailed-deal-type-badge')]").exists?).to be_truthy
      #Get Deals &Save & Show coupon code
      fail"Deal&Save or Coupon Code buttons are not displayed" if !(@browser.element(:xpath, ".//*[@id='main']/div[1]/ul/li[#{i}]/div/div[2]/span").exists? || @browser.element(:xpath, ".//*[@id='main']/div[1]/ul/li[#{i}]//div[@class='deal-button has-code']").exists?)
      puts (@browser.element(:xpath, ".//*[@id='main']//div//li[#{i}]//span[@class='click-count']").exists?)
      puts "#{i}"
      if @browser.element(:xpath, ".//*[@id='main']//div//li[#{i}]//span[@class='click-count']").exists?
        text = @browser.element(:xpath, ".//*[@id='main']//div//li[#{i}]//span[@class='click-count']").text
        puts "text:#{text}"
      else
        puts "There is no used items section present in the merchant landing page for list item #{i}"
      end
    end
  end
end

Then(/^I click on add comment and post the comment$/) do
  on(SiteMerchantLanding) do |page|
    page.add_comment_section('Hai !!!')
  end
end

And(/^I click on coupon badge link in the merchant landing page$/) do
  on(SiteMerchantLanding) do |page|
    page.coupon_badge_element.when_present.click
  end
end

Then(/^I verify the model pop up window opened in new tab$/) do
  tab_count = @browser.windows.count
  fail"new tab is not opened" if tab_count.size <= 1
  @browser.windows.last.use
  # #Sleep 2
  on(SiteMerchantLanding) do |page|
    until page.deal_sale_model_popup_element.exists? || page.coupon_code_model_popup_element.exists? do sleep 1 end
    if page.deal_sale_model_popup_element.exists?
      puts page.popup_header_element.exists?
      expect(page.popup_header_element.exists?).to be_truthy  # passes if actual is truthy (not nil or false)
      puts page.no_code_needed_element.exists?
      expect(page.no_code_needed_element.exists?).to be_truthy
      puts page.shop_at_merchant_element.exists?
      expect(page.shop_at_merchant_element.exists?).to be_truthy

      # link_text = page.shop_at_merchant_element.text
      # puts"link_text:#{link_text}"
      page.shop_at_merchant_element.click
      tab_count = @browser.windows.count
      fail"new tab is not opened" if tab_count.size <= 1
      @browser.windows.last.use
      # #Sleep 2
      new_wind_url = @browser.url.to_s
      puts"new_wind_url:#{new_wind_url}"
      link_text = $link1.downcase.gsub(" ", "").gsub("'","").gsub("&","and")
      puts"link_text:#{link_text}"
      raise"Merchant url is not opened in new tab" if !(new_wind_url.include? link_text)
      @browser.windows.last.use.close
      # #Sleep 2
      @browser.windows.last.use
      expect(page.email_signup_header_element.exists?).to be_truthy
      expect(page.email_signup_text_element.exists?).to be_truthy

      page.email_text_field = "test@gmail.com"
      page.btn_sign_me_up_element.when_present.click
      fail "Thanks for signing up! - message is not getting displayed" if !((page.msg_signup_success_element.when_present.text) == "Thanks for signing up!")
      # page.pop_up_close_element.click
      @browser.windows.last.use.close
    # elsif page.coupon_code_model_popup_element.when_present
    elsif page.coupon_code_model_popup_element.exists?
      puts"#######Start###########"
      # puts page.has_coupon_code_model_popup?
      puts page.popup_header_element.exists?
      expect(page.popup_header_element.exists?).to be_truthy  # passes if actual is truthy (not nil or false)
      puts page.copy_code_element.exists?
      expect(page.copy_code_element.exists?).to be_truthy
      puts page.code_text_element.exists?
      expect(page.code_text_element.exists?).to be_truthy
      puts"#######End###########"
      text_before_copy = page.copy_code_element.text
      puts"text_before_copy:#{text_before_copy}"
      page.copy_code_element.click
      #####Pending
      # Copy Code functionality
      text_after_copy = page.copy_code_element.text
      puts"text_after_copy:#{text_after_copy}"
      # find(:xpath,"html/body//div/li/form//div/input[@id='user_email']").set("test@gmail.com")
    else
      fail 'Model popup window is not getting displayed'
    end
  end
end

Then(/^I search for never miss coupons section and verify in merchant landing page$/) do
  count = 2
  on(SiteMerchantLanding) do |page|
    count = 1 if page.email_sign_up_element.exists?
    page.coupons_badge_list_elements.each do |e|
      if e.text.include? "Never miss"
        puts"test:#{e.text}"
        puts"count in:#{count}"
        expect(@browser.element(:xpath, ".//*[@id='main']/div[1]/ul/li[#{count}]").exists?).to be_truthy
        @browser.text_field(:xpath, ".//*[@id='main']/div[1]/ul/li[#{count}]/form//div/input[@id='user_email']").when_present
        @browser.text_field(:xpath, ".//*[@id='main']/div[1]/ul/li[#{count}]/form//div/input[@id='user_email']").set 'test@gmail.com'
        @browser.element(:xpath, ".//*[@id='main']/div[1]/ul/li[#{count}]/form/button").when_present.click
        fail'Thanks for signing up! - message is not dispalyed' if !((@browser.element(:xpath, ".//*[@id='main']/div[1]/ul/li[#{count}]//div[@class='title']").when_present.text) == ("Thanks for signing up!"))
        @browser.element(:xpath, ".//*[@id='main']/div[1]/ul/li[#{count}]/div/ul/li[1]").when_present.click
        # page.sign_up_choose_cause_elements.each do |causes|
        #   puts"causes:#{causes}"
        #   fail"causes not present" if causes.text.nil?
        # end

        on(GoodShopHome)do|page|
         puts page.msg_flash_notice_element.when_present.text
         fail'Great choice! You are now supporting - flash message is not displayed' if !(page.msg_flash_notice_element.when_present.text.include? "Great choice! You are now supporting")
         #Cause selected
         expect(page.cause_choosen_element.exists?).to be_truthy if !(page.email_sign_up_element.exists?)

         if @browser.url.include? 'uat'
           if !(page.cause_choosen_element.exists?)
             expect(@browser.url).to eq('https://uat.goodsearch.com/register?return_path=%2Fcharity_histories')
           else
             expect(@browser.url).to eq('https://uat.goodsearch.com/goodshop')
           end
         else
           expect(@browser.url).to eq('https://www.goodsearch.com/goodshop')
         end
        end


        @browser.back
        break;
      end
      count+=1
    end
  end
end

Then(/^I verify breadcrumbs, about, sticky and other footers, social media icon section$/) do
  on(SiteMerchantLanding) do |obj|
    obj.merchant_logo_element.when_present
  # breadcrumbs section
    current_url = @browser.url
    obj.breadcrumbs_section_tabs_element.when_present
    expect(obj.breadcrumbs_section_tabs_element.exists?).to be_truthy
    expect(obj.breadcrumbs_tabs_parted_element.exists?).to be_truthy
    obj.breadcrumbs_tab_home_element.when_present.click

    puts"current_url:#{current_url}"
    puts"new usrl:#{@browser.url}"
    # new_url = @browser.url
    # until (current_url) == (new_url) do
    #   sleep 1
    #   puts"current_url:#{current_url}"
    #   new_url = @browser.url
    #   puts"new_url:#{@browser.url}"
    # end
    on(GoodShopHome) do |page|
      page.good_search_logo_element.when_present
    end
    if !(@browser.url.nil?) && (@browser.url.include? "uat")
      if obj.email_sign_up_element.exists?
        fail"expected url:#{@browser.url} is not included 'https://uat.goodsearch.com/'" if @browser.url.include? 'https://uat.goodsearch.com/'
      else
        expect(@browser.url).to eq("https://uat.goodsearch.com/")
      end
    else
      expect(@browser.url).to eq("https://www.goodsearch.com/")
    end
    # end
    #Sleep 2
    @browser.back
    #Sleep 3

  # About section
    expect(obj.about_section_element.exists?).to be_truthy
    expect(obj.about_orbitz_deals_element.exists?).to be_truthy
    expect(obj.about_orbitz_deals_copy_element.exists?).to be_truthy

  # Temporary sticky notes
    if obj.large_image_element.exists?
      obj.large_image_element.click
      #Sleep 2
      tab_count = @browser.windows.count
      puts"tab_count:#{tab_count}"
      fail"new tab is not opened" if tab_count.size <= 1
      @browser.windows.last.use
      #Sleep 2
      fail"Temporary sticky notes url is not present" if @browser.url.to_s.empty?
      #Sleep 1
      @browser.windows.last.use.close
      @browser.windows.first.use
      #Sleep 2
    end

  # Footer links
    expect(obj.footer_link_GS_element.exists?).to be_truthy
    expect(obj.footer_link_about_GS_element.exists?).to be_truthy
    expect(obj.footer_link_about_GS_parted_element.exists?).to be_truthy
    obj.footer_link_GS_aboutUs_element.when_present.click
    #Sleep 3
    obj.about_us_header_element.when_present
    if @browser.url.include? "uat"
      if obj.email_sign_up_element.exists?
        fail"expected url:#{@browser.url} is not included 'https://uat.goodsearch.com/about'" if @browser.url.include? 'https://uat.goodsearch.com/about'
      else
        expect(@browser.url).to eq("https://uat.goodsearch.com/about")
      end
    else
      expect(@browser.url).to eq("https://www.goodsearch.com/about")
    end
    #Sleep 1
    @browser.back
    #Sleep 2
    obj.footer_contactUs_element.when_present.click
    obj.about_us_header_element.when_present
    #Sleep 3
    if @browser.url.include? "uat"
      if obj.email_sign_up_element.exists?
        fail"expected url:#{@browser.url} is not included 'https://uat.goodsearch.com/contact'" if @browser.url.include? 'https://uat.goodsearch.com/contact'
      else
        expect(@browser.url).to eq("https://uat.goodsearch.com/contact")
      end
    else
      expect(@browser.url).to eq("https://www.goodsearch.com/contact")
    end
    #Sleep 1
    @browser.back

    #Sleep 2

    expect(obj.footer_link_causes_element.exists?).to be_truthy
    expect(obj.footer_link_causes_parted_element.exists?).to be_truthy

    obj.footer_link_causes_firstL_element.when_present.click
    obj.causes_header_element.when_present
    #Sleep 2
    if @browser.url.include? "uat"
      if obj.email_sign_up_element.exists?
        fail"expected url:#{@browser.url} is not included 'https://uat.goodsearch.com/causes'" if @browser.url.include? 'https://uat.goodsearch.com/causes'
      else
        expect(@browser.url).to eq('https://uat.goodsearch.com/causes')
      end
    else
      expect(@browser.url).to eq('https://www.goodsearch.com/causes')
    end
    #Sleep 1
    @browser.back
    #Sleep 2

    obj.footer_link_causes_secondL_element.when_present.click
    obj.choose_cause_header_element.when_present
    # until obj.choose_cause_header_element.present? sleep 1 do end
    # sleep 3
    if @browser.url.include? 'uat'
      if obj.email_sign_up_element.exists?
        fail"expected url:#{@browser.url} is not included 'https://uat.goodsearch.com/choosecause'" if @browser.url.include? 'https://uat.goodsearch.com/choosecause'
      else
        expect(@browser.url).to eq('https://uat.goodsearch.com/choosecause')
      end
    else
      expect(@browser.url).to eq('https://www.goodsearch.com/choosecause')
    end
    #Sleep 2
    @browser.back
    #Sleep 2

    obj.footer_link_causes_thirdL_element.click
    obj.spread_the_word_element.when_present
    # sleep 2
    if @browser.url.include? 'uat'
      if obj.email_sign_up_element.exists?
        fail"expected url:#{@browser.url} is not included 'https://uat.goodsearch.com/spreadtheword'" if @browser.url.include? 'https://uat.goodsearch.com/spreadtheword'
      else
        expect(@browser.url).to eq('https://uat.goodsearch.com/spreadtheword')
      end
    else
      expect(@browser.url).to eq("https://www.goodsearch.com/spreadtheword")
    end
    #Sleep 1
    @browser.back
    #Sleep 2

    obj.footer_link_causes_fourthL_element.click
    #Sleep 2
    if obj.email_sign_up_element.exists?
      obj.good_search_give_visitor_element.when_present
    else
      obj.add_cause_page_element.when_present
    end

    if @browser.url.include? 'uat'
      if obj.email_sign_up_element.exists?
        fail"expected url:#{@browser.url} is not included 'https://uat.goodsearch.com/causes/new'" if @browser.url.include? 'https://uat.goodsearch.com/causes/new'
      else
        expect(@browser.url).to eq('https://uat.goodsearch.com/causes/new')
      end
    else
      expect(@browser.url).to eq('https://www.goodsearch.com/causes/new')
    end
    #Sleep 1
    @browser.back
    #Sleep 2

    expect(obj.footer_link_raise_element.exists?).to be_truthy
    expect(obj.footer_link_raise_parted_element.exists?).to be_truthy
    #Sleep 2

    obj.footer_link_raise_firstL_element.click
    obj.good_shop_app_element.when_present
    #Sleep 2
    if @browser.url.include? 'uat'
      if obj.email_sign_up_element.exists?
        fail"expected url:#{@browser.url} is not included 'https://uat.goodsearch.com/mobile'" if @browser.url.include? 'https://uat.goodsearch.com/mobile'
      else
        expect(@browser.url).to eq('https://uat.goodsearch.com/mobile')
      end
    else
      expect(@browser.url).to eq('https://www.goodsearch.com/mobile')
    end
    #Sleep 1
    @browser.back
    #Sleep 2

    obj.footer_link_raise_thirdL_element.when_present.click
    obj.good_serch_header_element.when_present
    #Sleep 2
    if @browser.url.include? 'uat'
      if obj.email_sign_up_element.exists?
        fail"expected url:#{@browser.url} is not included 'https://uat.goodsearch.com/'" if @browser.url.include? 'https://uat.goodsearch.com/'
      else
        expect(@browser.url).to eq('https://uat.goodsearch.com/')
      end
    else
      expect(@browser.url).to eq('https://www.goodsearch.com/')
    end
    #Sleep 1
    @browser.back
    #Sleep 2

    obj.footer_link_raise_fourthL_element.when_present.click
    obj.travel_deal_element.when_present
    #Sleep 2
    if @browser.url.include? 'uat'
      if obj.email_sign_up_element.exists?
        fail"expected url:#{@browser.url} is not included 'https://uat.goodsearch.com/travel-deals'" if @browser.url.include? 'https://uat.goodsearch.com/travel-deals'
      else
        expect(@browser.url).to eq('https://uat.goodsearch.com/travel-deals')
      end
    else
      expect(@browser.url).to eq('https://www.goodsearch.com/travel-deals')
    end
    #Sleep 1
    @browser.back
    #Sleep 3

    obj.footer_link_raise_sixthL_element.when_present.click
    obj.grocery_coupons_element.when_present
    #Sleep 2
    if @browser.url.include? 'uat'
      if obj.email_sign_up_element.exists?
        fail"expected url:#{@browser.url} is not included 'https://uat.goodsearch.com/grocery'" if @browser.url.include? 'https://uat.goodsearch.com/grocery'
      else
        expect(@browser.url).to eq('https://uat.goodsearch.com/grocery')
      end
    else
      expect(@browser.url).to eq('https://www.goodsearch.com/grocery')
    end
    #Sleep 1
    @browser.back
    #Sleep 2

  # Social
    expect(obj.social_media_links_element.exists?).to be_truthy
    expect(obj.social_media_single_link_element.exists?).to be_truthy

    for i in 1..4
      text_link = @browser.link(:xpath,"//*[@id='main-content']//div[@class='social']/a[#{i}]").when_present.text
      @browser.link(:xpath,"//*[@id='main-content']//div[@class='social']/a[#{i}]").when_present.click
      #Sleep 2
      obj.verifyNewTabs
      puts"new_url:#{$new_wind_url}"
      #Below line needs to validate
      fail "#{text_link} goodshop url is not present" if !(($new_wind_url.include? 'goodshop') || ($new_wind_url.include? 'plus.google.com'))
    end
  end
end