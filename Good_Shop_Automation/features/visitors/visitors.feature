####################################################################################################
# @Author: Sudhakar Mandati
# @Date: 11-07-2016
# @Organisation: Tekinroads
####################################################################################################

Feature: Commissionable Registered Users Functionalities


  ## TC-1,2,3,6
  Scenario: Verify the merchant landing page functionality
    Given I visit the good search home page
#    And I login with valid credentials
    When I search for site merchant link under search bar and clcik on it
    Then I verify the site merchant landing page with all the details

#TC-9
  Scenario: Verify that content on coupon box are getting displayed
    Given I visit the good search home page
    When I search for site merchant link under search bar and clcik on it
    And I verify the content present on coupon box
    Then I click on add comment and post the comment

      ##TC-10,11
  Scenario: verify model window pop up gets displayed in a new tab
    Given I visit the good search home page
#    And I login with valid credentials
    When I search for site merchant link under search bar and clcik on it
    And I click on coupon badge link in the merchant landing page
    Then I verify the model pop up window opened in new tab

    ##TC-13
  Scenario: verify never miss window displayed
    Given I visit the good search home page
#    And I login with valid credentials
    When I search for site merchant link under search bar and clcik on it
    Then I search for never miss coupons section and verify in merchant landing page

    ##TC-15,16,17,18,19
  Scenario: verify breadcrumbs, about, sticky and other footers, social media icon section
    Given I visit the good search home page
#    And I login with valid credentials
    When I search for site merchant link under search bar and clcik on it
    Then I verify breadcrumbs, about, sticky and other footers, social media icon section

