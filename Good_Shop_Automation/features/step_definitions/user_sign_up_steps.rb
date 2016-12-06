Then(/^I enter valued for all the mandatory fields in user registration page and click on sign me up$/) do
  on(UserSignUp) do |page|
    page.sign_me($ufname, $ulname, $uremail,$urpwd)
  end
end