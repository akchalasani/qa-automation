####################################################################################################
# @Author: Sudhakar Mandati
# @Date: 11-07-2016
# @Organisation: Tekinroads
####################################################################################################

Feature: Commissionable Registered Users Functionality
## TC-1,2,3,6
  Scenario: Verify the merchant landing page functionality
    Given I visit the good search home page
    And I login with valid credentials
    When I click on site merchant link under search bar
    And I verify the site merchant landing page with all the details
    Then I click on site merchant logo and verify the merchant home page in tab

    ## TC-4,5
  Scenario: Verify the stars rating update functionality in merchant landing page
    Given I visit the good search home page
    When I click on site merchant link under search bar
    Then I update the star ratings by clicking on it and login through emailid or facebook
