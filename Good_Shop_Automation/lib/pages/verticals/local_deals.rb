class LocalDeals
  include PageObject
  include ::SpecHandler

############ Page Objects ########################

  element       :page_title,                id:"page-title"
  element       :btn_drop_down,             xpath: ".//*[@id='city-button']/span[2]"

  def verify_local_deal_links
    links_present=[]
    @browser.elements(:xpath, ".//*[@class='double-wide']/li").each do |link_text|
       if !(link_text.text.nil?)
         links_present << link_text.text
       end
    end
    links_present.size

    for i in 1..links_present.size
      @browser.element(:xpath, ".//*[@class='double-wide']/li[#{i}]").when_present.click
      self.page_title_element.wait_until_present
      fail"The link which we clicked and the text which is selected under drop down are not matching " if !((self.btn_drop_down_element.text).eql?  links_present[i-1])

      if (@browser.url.to_s.downcase.include? links_present[i-1].gsub(' ', '-').downcase)
        @browser.back
      else
        fail"#{links_present[i-1].downcase} - is not present in the url:#{@browser.url.to_s.downcase})"
      end
      click_local_menu
    end
  end
end