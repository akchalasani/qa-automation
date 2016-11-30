# begin
# rescue Exception => e
#   puts " Exception at hooks " + e.class.to_s
# end

require 'selenium-webdriver'
require 'watir'
require 'page-object'


Before do|scenario|
  # @browser.cookies.clear
  puts "The scenario that is currently running is " + scenario.name.to_s
end

After do|scenario|
  take_screenshot(scenario) if scenario.failed?
  @browser.close
  # @browser.cookies.clear
end


############# reusable definition to take screen shot and attach it to the .html report ############
def take_screenshot(scenario)
  scenario_name = "#{scenario.name}_step"
  sshot_name = "log/screens/" + scenario_name +".png"
  @browser.screenshot.save(sshot_name) rescue nil
  embed(sshot_name, 'image/png') rescue nil
end
