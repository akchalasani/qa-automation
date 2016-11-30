module SpecHandler
  include PageObject

  ############# Page Objects using Site Prism ########################

  text_field        :search_store,       id: 'store'
  element           :email_sign_up,      xpath:".//*[@id='global-masthead']//div[2]/a"
  element           :local_menu,         xpath: ".//div[contains(@class, 'local-deals with-dropdown')]"
  element           :travel_menu,        xpath: ".//div[contains(@class, 'travel-deals with-dropdown')]"
  # div               :breadcrumb,         class: "breadcrumbs"


    # def click_link(locatior)
    #   puts"locatior:#{locatior}"
    #   "#{locatior}_element".click if ("#{locatior}_element").exists?
    # end

  #
  # def alert_present?
  #   begin
  #     @browser.switch_to.alert
  #     return true
  #   rescue
  #     return false
  #   end
  # end


  # def page_initialize(xpath_locator)
  #   # count = 1
  #   # until @browser.element(:xpath=>"#{xpath_locator}").exists? do
  #   #   sleep 1
  #   #   fail "#{xpath_locator} - is not visible until 5 seconds" if count == 5
  #   # end
  #   Watir::Wait.until {footer_link_raise_element.exists?}
  # end

  # def app_invoke
  #   ############ Read Browser type from the browser.yml file #########################
  #   path = File.join __dir__, '../config/browsers.yml'
  #   puts"path:#{path}"
  #   browser_type = YAML.load(File.open(path))
  #   puts"browser:#{browser_type['browser']}"
  #   @browser = Watir::Browser.new :"#{browser_type['browser']}"
  #   @browser.cookies.clear
  #   @browser.window.maximize
  #   @browser.goto ENV['PAGE_URL']
  #   @browser.alert.ok if @browser.alert.exists?
  #   # @browser.driver.manage.timeouts.page_load = 10
  # end

  def click_local_menu
    self.local_menu_element.when_present.click
  end

  def click_travel_menu
    self.travel_menu_element.when_present.click
  end


  def open_merch_link(link_name)
    puts"link_name:#{link_name}"
    search_store_element.when_present
    self.search_store = link_name
    sleep 2
    @browser.send_keys :arrow_down
    sleep 2
    @browser.send_keys :enter
  end

  def verifyNewTabs
    # count = 1
    # until @browser.windows.count > 1 do
    #   sleep 1
    #   fail "New tab is not opened until 5 seconds" if count == 10
    #   if @browser.windows.count > 1
    #     puts"Test"
    #     @browser.windows.last.use
    #     until @browser.url.to_s != "about:blank" do sleep 1 end
    #   end
    # end

    tab_count = @browser.windows.count
    # puts"tab_count:#{tab_count}"
    fail"new tab is not opened" if tab_count.size <= 1
    # sleep 5
    @browser.alert.close if @browser.alert.present?
    # @browser.windows.last.use
    # until @browser.url.to_s != "about:blank" do sleep 1 end
    @browser.windows.last.use
    # sleep 3
    # @browser.alert.close if @browser.alert.present?
    $new_wind_url = @browser.url.to_s
    # puts"new_tab_title:#{$new_wind_url}"
    # sleep 5
    @browser.windows.last.use.close

    @browser.windows.first.use
    old_tab_title = @browser.url.to_s
    # puts"old_tab_title:#{old_tab_title}"
  end
end
