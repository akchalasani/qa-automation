And(/^I click on Sign In link$/) do
  on(GoodShopHome)do|page|
    page.click_signin
  end
end

# And(/^I click on create cause$/) do
#   on(LoginPage) do |page|
#     page.create_cause.click
#     # sleep 8
#   end
# end

Given(/^I visit the good search home page$/) do
  app_invoke
end

And(/^I login with valid credentials$/) do
  step "I click on Sign In link"
  on(LoginPage) do |page|
    page.log_in($user_email,$user_pwd)
    page.loged_in_user_element.when_present
  end
end

