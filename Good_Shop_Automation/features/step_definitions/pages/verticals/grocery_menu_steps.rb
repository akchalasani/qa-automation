Then(/^I verify the grocery page by clicking on each link present under grocery menu drop down$/) do
  on(GroceryMenu) do |page|
    page.verify_grocery_links
  end

end