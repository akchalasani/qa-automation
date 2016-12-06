class GroceryMenu
  include PageObject
  include ::SpecHandler

############ Page Objects ########################

  element       :grocery_title,             class:'grocery-title'
  div           :never_miss_coupons,        class:'panel opened'


  def verify_grocery_links
    links_present=[]
    @browser.elements(:xpath, ".//*[@class='double-wide end-aligned']/li").each do |link_text|
      if !(link_text.text.nil?)
        test = link_text.text
        if test == 'Beverages'
          test = test[0..-2]
        end
        links_present << test
      end
    end
    links_present.size
    #we are using starting index value as 2, since All coupons
    # like text is not present in either of the place browser url and grocery title
    for i in 2..links_present.size
      puts"Text: #{links_present[i-1].to_s+' Coupons'} "
      @browser.element(:xpath, ".//*[@class='double-wide end-aligned']/li[#{i}]").when_present.click
      puts"#{grocery_title_element.when_present.text}"
      self.grocery_title_element.when_present
      fail"Grocery titel and the link text which we clicked on are not matching with each other" if !(self.grocery_title_element.when_present.text.eql? links_present[i-1]+' Coupons')
      fail"Never miss coupons footer section is not present" if !(self.never_miss_coupons_element.exists?)
      if (@browser.url.to_s.downcase.include? links_present[i-1].gsub(' ', '-').downcase)
        @browser.back
      else
        fail"#{links_present[i-1].downcase} - is not present in the url:#{@browser.url.to_s.downcase})"
      end
      click_grocery_menu
    end
  end
end


