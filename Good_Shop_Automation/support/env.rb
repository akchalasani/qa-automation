require 'selenium-webdriver'
require 'page-object'
require 'require_all'
require 'yaml'
require 'watir'
# require 'rspec'




######### Definition to create object for the class ############
# def on(class_name)
#   yield class_name.new
# end

def on(class_name)
  yield class_name.new(@browser)
end

####### To Load all the libraries #################
require_all './lib'

############# Read user credentials from the users.yml file #########################

path = File.join __dir__, '../config/users.yml'
app_access = YAML.load(File.open(path))
$user_email = app_access["prod"]["user"]
$user_pwd = app_access["prod"]["pass"]

############ Read test data from the test_data.yml file #########################
path = File.join __dir__, '../config/test_data/test_data.yml'
merch_link = YAML.load(File.open(path))
$link1 = merch_link['com_merch_links']['link1'].downcase
$link2 = merch_link['com_merch_links']['link2'].downcase



def app_invoke
  ############ Read Browser type from the browser.yml file #########################
  path = File.join __dir__, '../config/browsers.yml'
  puts"path:#{path}"
  browser_type = YAML.load(File.open(path))
  puts"browser:#{browser_type['browser']}"
  @browser = Watir::Browser.new :"#{browser_type['browser']}"
  @browser.cookies.clear
  @browser.window.maximize
  puts"ENV['PAGE_URL']:#{ENV['PAGE_URL']}"
  @browser.goto ENV['PAGE_URL']
  @browser.alert.ok if @browser.alert.exists?
  # @browser.driver.manage.timeouts.page_load = 10
end




# ########## Switching the browsers based on the browser info specified in the browsers.yml file#############
# if browser_type['browser'].downcase == 'chrome'
#   Capybara.default_driver = :chrome
#   Capybara.register_driver :chrome do |app|
#     Capybara::Selenium::Driver.new(app, :browser => :chrome)
#   end
#   Capybara.default_max_wait_time = 10
#   Capybara.page.driver.browser.manage.window.maximize
#   Capybara.page.driver.browser.manage.delete_all_cookies
# elsif browser_type['browser'].downcase == 'firefox'
#   Capybara.default_driver = :firefox
#   Capybara.register_driver :firefox do |app|
#     Capybara::Selenium::Driver.new(app, :browser => :firefox)
#   end
#   Capybara.default_max_wait_time = 10
#   Capybara.page.driver.browser.manage.window.maximize
#   Capybara.page.driver.browser.manage.delete_all_cookies
# end





