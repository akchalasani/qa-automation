Then(/^I verify the travel deals page by clicking on each link present under travel menu drop down$/) do
  on(TravelDeals) do |page|
    page.verify_travel_deal_links
  end
end