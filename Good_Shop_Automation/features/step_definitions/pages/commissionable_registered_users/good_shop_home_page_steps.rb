When(/^I search for site merchant link under search bar and clcik on it$/) do
  on(GoodShopHome) do |page|
    page.open_merch_link($link1)
  end
end

