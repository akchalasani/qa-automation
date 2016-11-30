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

  Scenario: Verify the functionality of the links which are present under more categories tab
    Given I visit the good search home page
    And I click on More Categories link
    Then I verify the functionality of all the links which are present under all categories

  Scenario: Verify the functionality of the links which are present under local menu drop down
    Given I visit the good search home page
    And I click on local menu drop down and verify the links present
    Then I verify the local deals page by clicking on each link present under local menu drop down

  Scenario: Verify the functionality of the links which are present under travel menu drop down
    Given I visit the good search home page
    And I click on travel menu drop down and verify the links present
    Then I verify the travel deals page by clicking on each link present under travel menu drop down


