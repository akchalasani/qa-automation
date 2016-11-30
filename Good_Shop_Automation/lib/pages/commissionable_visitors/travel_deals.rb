class TravelDeals
  include PageObject
  include ::SpecHandler

############ Page Objects ########################

  element       :item_selected,             xpath: ".//*[@class='travel-category-header selected']"
  div           :never_miss_deals,          class: 'panel opened'
  element       :breadcrumb,                xpath: ".//*[@class='travel-nav-left']//div/span"



  def verify_travel_deal_links
    links_present=[]
    @browser.elements(:xpath, ".//div[contains(@class, 'travel-deals with-dropdown')]//li").each do |link_text|
      if !(link_text.text.nil?)
        test = link_text.text[0...-1]
        puts"test:#{test}"
        links_present << test.split("#{/\d+/}")
      end
    end
    links_present.size
    for i in 1..links_present.size
      @browser.element(:xpath, ".//div[contains(@class, 'travel-deals with-dropdown')]//li[#{i}]").when_present.click
      # sleep 4
      # self.breadcrumb_element.when_present
      # puts"breadcrumb_element:#{self.breadcrumb_element.text}"
      self.never_miss_deals_element.when_present
      sleep 4
      puts"item_selected_element.text: #{self.item_selected_element.text}"
      puts"links_present[i-1]:#{links_present[i-1]}"
      fail"Category header selected and the travel link clicked are different" if self.item_selected_element.text.strip.equal? links_present[i-1]


      if (@browser.url.to_s.downcase.include? links_present[i-1].to_s.gsub(' ', '-').downcase)
        @browser.back
      else
        fail"#{links_present[i-1].to_s.downcase} - is not present in the url:#{@browser.url.to_s.downcase})"
      end
      click_travel_menu
    end
  end
end