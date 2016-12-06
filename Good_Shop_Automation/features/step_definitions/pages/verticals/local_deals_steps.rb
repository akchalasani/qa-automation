Then(/^I verify the local deals page by clicking on each link present under local menu drop down$/) do
  on(LocalDeals) do |page|
    page.verify_local_deal_links
  end
end