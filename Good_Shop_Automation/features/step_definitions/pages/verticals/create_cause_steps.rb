When(/^I click on sign at the bottom and login$/) do
  on(CreateCause) do |page|
    page.signin_click
  end
end
