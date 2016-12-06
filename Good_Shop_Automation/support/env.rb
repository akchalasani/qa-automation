require 'selenium-webdriver'
require 'page-object'
require 'require_all'
require 'yaml'
require 'watir'
require 'rspec'


def on(class_name)
  yield class_name.new(@browser)
end

####### To Load all the libraries #################
require_all './lib'

##############Sign Up######################
path = File.join __dir__, '../config/users.yml'
app_access = YAML.load(File.open(path))

$ufname = app_access["sign_up"]["fname"]
$ulname = app_access["sign_up"]["lname"]
$uremail = app_access["sign_up"]["uemail"]
$urpwd   = app_access["sign_up"]["upwd"]

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

# def footer_cause_urls(env)
#   if env == 'uat'
    $arr_uat=[]
    $arr_uat << merch_link['cause_section_urls']['cause_url5']
    $arr_uat << merch_link['cause_section_urls']['cause_url6']
    $arr_uat << merch_link['cause_section_urls']['cause_url7']
    $arr_uat << merch_link['cause_section_urls']['cause_url8']
  # else
    $arr_prod=[]
    $arr_prod << merch_link['cause_section_urls']['cause_url1']
    $arr_prod << merch_link['cause_section_urls']['cause_url2']
    $arr_prod << merch_link['cause_section_urls']['cause_url3']
    $arr_prod << merch_link['cause_section_urls']['cause_url4']
#   end
# end


$raise_arr_prod=[]
$raise_arr_prod << merch_link['more_ways_to_raise']['raise_url1']
$raise_arr_prod << merch_link['more_ways_to_raise']['raise_url2']
$raise_arr_prod << merch_link['more_ways_to_raise']['raise_url3']
$raise_arr_prod << merch_link['more_ways_to_raise']['raise_url4']
$raise_arr_prod << merch_link['more_ways_to_raise']['raise_url5']
$raise_arr_prod << merch_link['more_ways_to_raise']['raise_url6']


$raise_arr_uat=[]
$raise_arr_uat << merch_link['more_ways_to_raise']['raise_url7']
$raise_arr_uat << merch_link['more_ways_to_raise']['raise_url8']
$raise_arr_uat << merch_link['more_ways_to_raise']['raise_url9']
$raise_arr_uat << merch_link['more_ways_to_raise']['raise_url10']
$raise_arr_uat << merch_link['more_ways_to_raise']['raise_url11']
$raise_arr_uat << merch_link['more_ways_to_raise']['raise_url12']




# ############ Read test data from the test_data.yml file #########################
# path = File.join __dir__, '../config/test_data/test_data.yml'
# footer_cause = YAML.load(File.open(path))
# $link1 = merch_link['com_merch_links']['link1'].downcase
# $link2 = merch_link['com_merch_links']['link2'].downcase

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
  $app_url = ENV['PAGE_URL']
  @browser.goto $app_url
  @browser.alert.ok if @browser.alert.exists?
  # @browser.driver.manage.timeouts.page_load = 10
end



