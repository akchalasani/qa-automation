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
    puts"new_url:#{$new_wind_url}"
    link = $link1.gsub("'","").gsub(" ", "").gsub("-","").gsub("&","and")
    #Below line needs to validate
    fail "#{link} : is not present in the new url- #{$new_wind_url}" if !($new_wind_url.include? "#{link}")

    expect(obj.merchant_landing_header_element.exists?).to be_truthy
    obj.cause_logo_element.when_present if !(obj.email_sign_up_element.exists?)
    expect(obj.cause_logo_element.exists?).to be_truthy if !(obj.email_sign_up_element.exists?)

# verifying the coupons and the deals which are present under All Coupons tab
    coupons = []
    obj.all_coupons_status_element.exists?
    obj.all_coupons_badge_elements.each do |e|
      coupons << e.text
      # puts"test:#{e.text}"
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
      # puts"test:#{e.text}"
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
      # puts"test:#{e.text}"
    end
    puts "size:#{coupons.size}"
    fail "No coupons present under all coupons filter"  if !(coupons.size.to_i > 1)


    ########Verify we donate section
    expect(obj.we_donate_element.exists?).to be_truthy
    obj.choose_cause_link_element.click
    sleep 5
    # on(GoodShopGive) do |page|
    #   page.search_bar_element.when_present
    # end
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
    obj.popular_stores_title_element.when_present
    expect(obj.popular_stores_title_element.exists?).to be_truthy
    links = []
    # obj.popular_store_link_element.when_present
    # @browser.element(:xpath,"//div[@id='sidebar']/div[1]/div[3]//div[@class='copy']").when_present
    obj.popular_stores_links_elements.each do |e|
       if e.visible?
         puts"link:#{e.text}"
         links << e.text
       end
    end

    fail "No links present under Coupons from Popular Stores"  if !(links.size.to_i > 1)

    ##########clicking on first link
    obj.popular_store_link_element.when_present.click
    sleep 4
    puts @browser.url
    link = links[0].split(" ")
    fail"The url which is opened doesn't contains: #{link[0].to_s.downcase}" if !(@browser.url.include? link[0].to_s.downcase)
    @browser.back

    #################################
    # counter = 1
    puts obj.related_stores_title_element.exists?
    # if obj.related_stores_title_element.exists?
      # puts"I am inside Until"
      # sleep 1
      # puts obj.related_stores_title_element.exists?
      if obj.related_stores_title_element.exists?
        links = []
        obj.related_stores_links_elements.each do |e|
          if e.visible?
            puts"links:#{e.text}"
            links << e.text
          end
        end
        fail 'No links present under Coupons from Related Stores'  if !(links.size.to_i > 1)
        obj.related_store_link_element.when_present.click
        sleep 4
        puts @browser.url
        link = links[0].split(" ")
        fail"Current url opened doesn't contains: #{link[0].to_s.downcase}" if !(@browser.url.include? link[0].to_s.downcase)
        @browser.back


        obj.deals_discounts_title_element.when_present
        expect(obj.deals_discounts_title_element.exists?).to be_truthy
        links = []
        obj.deals_discounts_links_elements.each do |e|
          if e.visible?
            puts"links:#{e.text}"
            links << e.text
          end
        end
        fail "No links present under Coupons from Popular Stores"  if !(links.size.to_i > 1)
        obj.deals_discounts_link_element.when_present.click
        sleep 4
        puts @browser.url
        link = links[0].split(" ")
        fail"Current url opened doesn't contains: #{link[0].to_s.downcase}" if !(@browser.url.include? link[0].to_s.downcase)
        @browser.back
      else
        obj.deals_discounts_title_element.when_present
        links = []
        obj.related_stores_links_elements.each do |e|
          if e.visible?
            puts"links:#{e.text}"
            links << e.text
          end
        end
        fail 'No links present under Deals & Discounts'  if !(links.size.to_i > 1)
        obj.related_store_link_element.when_present.click
        sleep 4
        puts @browser.url
        link = links[0].split(" ")
        fail"Current url opened doesn't contains: #{link[0].to_s.downcase}" if !(@browser.url.include? link[0].to_s.downcase)
        @browser.back
      end
      # break if counter >= 3
      # counter+=1
      # puts"countersss:#{counter}"
    # end
    # puts"counter:#{counter}"
    # if counter >= 2
    #   obj.deals_discounts_title_element.when_present
    #   links = []
    #   obj.related_stores_links_elements.each do |e|
    #     if e.visible?
    #       puts"links:#{e.text}"
    #       links << e.text
    #     end
    #   end
    #   fail 'No links present under Deals & Discounts'  if !(links.size.to_i > 1)
    #   obj.related_store_link_element.when_present.click
    #   # sleep 4
    #   puts @browser.url
    #   link = links[0].split(" ")
    #   fail"Current url opened doesn't contains: #{link[0].to_s.downcase}" if !(@browser.url.include? link[0].to_s.downcase)
    #   @browser.back
    # else
    #   obj.deals_discounts_title_element.when_present
    #   # puts"I am In else condition"
    #   expect(obj.deals_discounts_title_element.exists?).to be_truthy
    #   links = []
    #   obj.deals_discounts_links_elements.each do |e|
    #     if e.visible?
    #       puts"links:#{e.text}"
    #       links << e.text
    #     end
    #   end
    #   fail "No links present under Coupons from Popular Stores"  if !(links.size.to_i > 1)
    #   obj.deals_discounts_link_element.when_present.click
    #   sleep 4
    #   puts @browser.url
    #   link = links[0].split(" ")
    #   fail"Current url opened doesn't contains: #{link[0].to_s.downcase}" if !(@browser.url.include? link[0].to_s.downcase)
    #   @browser.back
    # end



    # ##########clicking on first link
    # obj.related_store_link_element.when_present.click
    # sleep 2
    # puts @browser.url
    # link = links[0].downcase.split(" ")
    # fail"Current url opened doesn't contains: #{link}" if !(@browser.url.include? link[0].to_s)
    # @browser.back

    ######################################
    # # obj.deals_discounts_title_element.when_present
    # expect(obj.deals_discounts_title_element.exists?).to be_truthy
    # links = []
    # obj.deals_discounts_links_elements.each do |e|
    #   if e.visible?
    #     puts"links:#{e.text}"
    #     links << e.text
    #   end
    # end
    #
    # fail "No links present under Coupons from Popular Stores"  if !(links.size.to_i > 1)

    ##########clicking on link
    # obj.deals_discounts_link_element.when_present.click
    # puts @browser.url
    # fail"Current url opened doesn't contains: #{links[0]}" if !(@browser.url.include? links[0].to_s)
    # @browser.back

    ########################################
    if obj.ios_app_title_element.exists?
    # obj.ios_app_title_element.when_present
      fail "!!!Expected iOS app title is not displayed" if !(obj.ios_app_title_element.when_present.text == "Shop, save, and give with our new iOS app!")
    end
    # expect(obj.ios_app_title_element.text).to eq("Shop, save, and give with our new iOS app!")
    puts"obj.get_app_link_element:#{obj.get_app_link_element.text}"
    expect(obj.get_app_link_element.exists?).to be_truthy
    # if obj.get_app_link_element.when_present
  end
end


And(/^I update the star ratings by clicking on it and login through emailid or facebook$/) do
  on(SiteMerchantLanding) do |obj|
    # obj.page_initialize(".//*[@id='sidebar']/div[1]/div[1]/div/div[1]/div[1]")
    obj.rating_star_element.when_present.click
    on(LoginPage) do |page|
      page.log_in($user_email,$user_pwd)
    end
    sleep 5
    title = ["Poor","Fair","Good", "Very Good","Excellent"]
    a=[]
    # j=0
    for i in 1..5
      p title[i]
      # @browser.element(:xpath => ".//*[@class='media-info-box']//span[@class='stars']/img[#{i}").when_present
      # sleep 4
      if @browser.element(:xpath => ".//*[@class='media-info-box']//span[@class='stars']/img[#{i}]").exists?
        fail "Star selected and the title displayed for the same are not matching" if !(@browser.element(:xpath => ".//*[@class='media-info-box']//span[@class='stars']/img[#{i}]").title == "#{title[i-1]}")
      end
      # fail "Star selected and the title displayed for the same are not matching" if !(@browser.element(:xpath => ".//*[@class='stars']/img[#{i}]").title == "#{title[j]}")
      sleep 1
      @browser.element(:xpath => ".//*[@class='media-info-box']//span[@class='stars']/img[#{i}]").click
      sleep 3
      a << @browser.element(:xpath => ".//*[@class='media-info-box']//div[@class='bottom']/span[1]").text  +  @browser.element(:xpath => ".//*[@class='media-info-box']//div[@class='bottom']/span[2]").text
      #Sleep 1
      # j+=1
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
    link_text = $link1.downcase.gsub(" ", "").gsub("'","").gsub("&","-and-")
    link_text1 = $link1.downcase.gsub(" ", "").gsub("'","").gsub("&","and")
    puts"link_text:#{link_text}"
    fail "#{link_text} or #{link_text1} : is not present in the url which is opened" if !($new_wind_url.include? "#{link_text}" or $new_wind_url.include? "#{link_text1}")
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
    sleep 5
    page.coupon_badge_element.when_present
    page.coupon_badge_element.click
  end
end

Then(/^I verify the model pop up window opened in new tab$/) do
  tab_count = @browser.windows.count
  puts"tab_count:#{tab_count}"
  puts tab_count < 2
  fail"new tab is not opened" if tab_count < 2
  @browser.windows.last.use
  # #Sleep 2
  on(SiteMerchantLanding) do |page|
    count = 1
    until page.deal_sale_model_popup_element.exists? || page.coupon_code_model_popup_element.exists? do
      sleep 1
      count+=1
      break if count > 5
    end
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
    puts "count_out:#{count}"
    page.coupon_badge_element.when_present
    page.coupons_badge_list_elements.each do |e|
      # sleep 8
      # puts"test_out:#{e.text}"
      if e.text.include? "Never miss"
        puts"test_in:#{e.text}"
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
    fail"Script didn't went in side the each loop" if count < 5
  end
end

Then(/^I verify breadcrumbs, about, sticky and other footers, social media icon section$/) do
  on(SiteMerchantLanding) do |obj|
    obj.merchant_logo_element.when_present
  #
  # # breadcrumbs section
  #   current_url = @browser.url
  #   obj.breadcrumbs_section_tabs_element.when_present
  #   expect(obj.breadcrumbs_section_tabs_element.exists?).to be_truthy
  #   expect(obj.breadcrumbs_tabs_parted_element.exists?).to be_truthy
  #   obj.breadcrumbs_tab_home_element.when_present.click
  #   puts"current_url:#{current_url}"
  #   puts"new usrl:#{@browser.url}"
  #   on(GoodShopHome) do |page|
  #     page.good_search_logo_element.when_present
  #   end
  #   if !(@browser.url.nil?) && (@browser.url.include? "uat")
  #     if obj.email_sign_up_element.exists?
  #       fail"expected url:#{@browser.url} is not included 'https://uat.goodsearch.com/'" if @browser.url.include? 'https://uat.goodsearch.com/'
  #     else
  #       expect(@browser.url).to eq("https://uat.goodsearch.com/")
  #     end
  #   else
  #     expect(@browser.url).to eq("https://www.goodsearch.com/")
  #   end
  #   @browser.back
  #
  # # About section
  #   expect(obj.about_section_element.exists?).to be_truthy
  #   # expect(obj.about_orbitz_deals_element.exists?).to be_truthy
  #   # expect(obj.about_orbitz_deals_copy_element.exists?).to be_truthy
  #
  # # Temporary sticky notes
  #   if obj.large_image_element.exists?
  #     obj.large_image_element.when_present.click
  #     #Sleep 2
  #     tab_count = @browser.windows.count
  #     puts"tab_count:#{tab_count}"
  #     fail"new tab is not opened" if tab_count.size <= 1
  #     @browser.windows.last.use
  #     #Sleep 2
  #     fail"Temporary sticky notes url is not present" if @browser.url.to_s.empty?
  #     #Sleep 1
  #     @browser.windows.last.use.close
  #     @browser.windows.first.use
  #     #Sleep 2
  #   end
  #
  # # Footer links
  #   expect(obj.footer_link_GS_element.exists?).to be_truthy
  #   expect(obj.footer_link_about_GS_element.exists?).to be_truthy
  #   expect(obj.footer_link_about_GS_parted_element.exists?).to be_truthy
  #   obj.footer_link_GS_aboutUs_element.when_present.click
  #   #Sleep 3
  #   obj.about_us_header_element.when_present
  #   if @browser.url.include? "uat"
  #     if obj.email_sign_up_element.exists?
  #       fail"expected url:#{@browser.url} is not included 'https://uat.goodsearch.com/about'" if @browser.url.include? 'https://uat.goodsearch.com/about'
  #     else
  #       expect(@browser.url).to eq("https://uat.goodsearch.com/about")
  #     end
  #   else
  #     expect(@browser.url).to eq("https://www.goodsearch.com/about")
  #   end
  #   #Sleep 1
  #   @browser.back
  #   #Sleep 2
  #   obj.footer_contactUs_element.when_present.click
  #   obj.about_us_header_element.when_present
  #   #Sleep 3
  #   if @browser.url.include? "uat"
  #     if obj.email_sign_up_element.exists?
  #       fail"expected url:#{@browser.url} is not included 'https://uat.goodsearch.com/contact'" if @browser.url.include? 'https://uat.goodsearch.com/contact'
  #     else
  #       expect(@browser.url).to eq("https://uat.goodsearch.com/contact")
  #     end
  #   else
  #     expect(@browser.url).to eq("https://www.goodsearch.com/contact")
  #   end
  #   #Sleep 1
  #   @browser.back
  #
  #
  #  # Cause Section
  #   cause_links=[]
  #   @browser.elements(:xpath, ".//*[@class='causes']/a").each do |e|
  #     cause_links << e.text
  #   end
  #   for i in 1..cause_links.size
  #     puts @browser.element(:xpath, ".//*[@class='causes']/a[#{i}]").when_present.text
  #     @browser.element(:xpath, ".//*[@class='causes']/a[#{i}]").when_present.click
  #     if @browser.url.include? "uat"
  #       puts"$cause_uat:#{$arr_uat[i-1]}"
  #       expect(@browser.url).to eq($arr_uat[i-1])
  #     else
  #       puts"$arr_prod:#{$arr_prod[i-1]}"
  #       expect(@browser.url).to eq($arr_prod[i-1])
  #     end
  #     @browser.back
  #   end


  # raise section
    raise_links=[]
    @browser.elements(:xpath, ".//*[@class='ways-to-raise']/a").each do |e|
      raise_links << e.text
    end
    puts"raise_links:#{raise_links}"
    for i in 1..raise_links.size
      puts @browser.element(:xpath, ".//*[@class='ways-to-raise']/a[#{i}]").when_present.text
      #####Avoiding to click on Local Deals link, since there is know issue ######################
      if !(raise_links[i-1] == 'Local Deals')
        @browser.element(:xpath, ".//*[@class='ways-to-raise']/a[#{i}]").when_present.click
        sleep 3
        if $app_url.include? "uat"
          puts"$raise_uat:#{$raise_arr_uat}"
          puts"$raise_uat:#{$raise_arr_uat[i-1]}"
          puts"@browser.url:#{@browser.url}"
          expect(@browser.url).to eq($raise_arr_uat[i-1])
        else
          puts"$raise_arr_prod:#{$raise_arr_prod[i-1]}"
          expect(@browser.url).to eq($raise_arr_prod[i-1])
        end
        @browser.back
      end
    end
  end
end

