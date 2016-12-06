
Then(/^I verify the functionality of all the links which are present under all categories$/) do
  on(AllCategories) do |page|
    page.verify_left_links
    page.verify_right_links
  end
end