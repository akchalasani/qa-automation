Then(/^I verify the support cause and create cause links functionality$/) do
  on(GoodShopGive) do |page|
    expect(page.good_shop_top_section_element.exists?).to be_truthy
    page.good_shop_give_logo_element.when_present
    page.support_cause_link_element.when_present
    page.create_cause_link_element.when_present
    page.cause_cards_section_element.when_present

    # verify_support_cause
    page.support_cause_link_element.when_present.click
    if @browser.url.include? "uat"
      expect(@browser.url).to eq("https://beyonce:blue_ivy@uat.goodsearch.com/choosecause")
    else
      expect(@browser.url).to eq("https://goodsearch.com/choosecause")
    end
    page.choose_cause_title_element.when_present
    expect(page.search_bar_element.exists?).to be_truthy
    expect(page.cause_cards_section_element.exists?).to be_truthy
    page.create_cause_card_link_element.when_present.click
    page.sign_up_header_element.when_present
    expect(page.fb_login_link_element.exists?).to be_truthy

    page.click_goodshop_give_menu

    # verify_create_cause
    page.create_cause_link_element.when_present.click
    if @browser.url.include? "uat"
      expect(@browser.url).to eq("https://beyonce:blue_ivy@uat.goodsearch.com/give/signup")
    else
      expect(@browser.url).to eq("https://goodsearch.com/give/signup")
    end

    page.sign_up_header_element.when_present
    expect(page.fb_login_link_element.exists?).to be_truthy
  end
end