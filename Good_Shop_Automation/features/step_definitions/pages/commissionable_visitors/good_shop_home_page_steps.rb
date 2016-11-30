And(/^I click on More Categories link$/) do
  on(VisitorsGoodShopHome) do |page|
    page.more_categories_link_element.when_present.click
  end
end


And(/^I click on local menu drop down and verify the links present$/) do
  on(VisitorsGoodShopHome) do |page|
    page.click_local_menu
    expect(page.local_dropdown_links_element.exists?).to be_truthy
  end
end

And(/^I click on travel menu drop down and verify the links present$/) do
  on(VisitorsGoodShopHome) do |page|
    page.click_travel_menu
    expect(page.travel_dropdown_links_element.exists?).to be_truthy
  end
end