class AllCategories
  include PageObject
  include ::SpecHandler

############ Page Objects ########################
  divs         :left_categories_links,     xpath: ".//div[@class='left-categories']/a"
  divs         :right_categories_links,     xpath: ".//div[@class='right-categories']/a"
  element      :categories_header,         xpath: ".//*[@class='featured-merchant-categories-list']/h1"

  div          :breadcrumb,                   class: "breadcrumbs"
  element      :right_categories_breadcrumb,  xpath: ".//*[@id='main-content']/div[2]/div/div[2]"
  element      :breadcrumb_text,              xpath: ".//*[@class='breadcrumbs']/span"






#########################################################################################################

  def verify_left_links
    self.categories_header_element.when_present
    links = []
    left_categories_links_elements.each do |link|
      links << link.text
    end
    puts"links:#{links.size}"
    fail"!!!!There are no links present under more categories section, Please check page objects and the page which is open currently" if links.size.nil?
    for i in 1..links.size
      link_name1 = @browser.element(:xpath,".//div[@class='left-categories']/a[#{i}]").text.downcase
      link_name = link_name1.gsub(' & ', '-').gsub("'", '').gsub(' ', '-').split('-')
      @browser.element(:xpath,".//div[@class='left-categories']/a[#{i}]").when_present.click
      self.breadcrumb_element.when_present
      txt_breadcrumb = self.breadcrumb_text_element.text.downcase.gsub(' & ', '-').gsub("'", '').gsub(' ', '-')
      fail"#{link_name[0]} : is not present in the breadcrumb text: #{txt_breadcrumb} " if !(txt_breadcrumb.include? link_name[0])
      # sleep 1
      puts"#{link_name}"
      puts"#{@browser.url}"

      if (@browser.url.to_s.downcase.include? link_name[0]) || (@browser.url.to_s.downcase.include? link_name[1])
        @browser.back
        until self.categories_header_element.exists? do sleep 1 end
      else
        fail"#{link_name} - page is not opened (url:#{@browser.url.to_s.downcase})"
      end
    end
  end

  def verify_right_links
    self.categories_header_element.when_present
    links = []
    right_categories_links_elements.each do |link|
      links << link.text
    end
    puts"links:#{links.size}"
    fail"!!!!There are no links present under more categories section, Please check page objects and the page which is open currently" if links.size.nil?
    for i in 1..links.size
      link_name1 = @browser.element(:xpath,".//div[@class='right-categories']/a[#{i}]").text.downcase
      link_name = link_name1.gsub(' & ', '-').gsub("'", '').gsub(' ', '-').split('-')
      @browser.element(:xpath,".//div[@class='right-categories']/a[#{i}]").when_present.click
      sleep 2
      if self.breadcrumb_element.exists?
        # self.breadcrumb_element.when_present
        txt_breadcrumb = self.breadcrumb_text_element.text.downcase.gsub(' & ', '-').gsub("'", '').gsub(' ', '-')
        fail"#{link_name1} : is not present in the breadcrumb text: #{txt_breadcrumb} " if !(txt_breadcrumb.include? link_name[0] or breadcrumb_text.include? link_name[1] )
      else
        fail"!!!breadcrumb section does not exists for - #{link_name1}" if !(self.right_categories_breadcrumb_element.exists?)
      end
      puts"#{link_name}"
      puts"#{@browser.url}"

      if (@browser.url.to_s.downcase.include? link_name[0]) || (@browser.url.to_s.downcase.include? link_name[1])
        @browser.back
        # until self.categories_header_element.exists? do sleep 1 end
        self.categories_header_element.when_present
      else
        fail"#{link_name} - page is not opened (url:#{@browser.url.to_s.downcase})"
      end
    end
  end



end