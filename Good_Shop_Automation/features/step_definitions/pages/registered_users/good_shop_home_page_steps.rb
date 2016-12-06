When(/^I search for site merchant link under search bar and clcik on it$/) do
  on(GoodShopHome) do |page|
    page.open_merch_link($link1)
    # sleep 10
  end
end


When(/^I click on sign In link then the join now link$/) do
  step "I click on Sign In link"
  on(UserSignUp)do |obj|
    obj.join_now_element.when_present.click
  end
end

Then(/^I verify the registered user name in the good search home page$/) do
  on(GoodShopHome)do|page|
    logged_in_user = page.signin_user_element.text
    puts"logged_in_user:#{logged_in_user}"
    puts"$ufname:#{$ufname}"
    fail "!!!!Logged in user name - #{logged_in_user} and the user name - #{$ufname} which we used while registering are not matching with each other" if !(logged_in_user == $ufname)
  end
end