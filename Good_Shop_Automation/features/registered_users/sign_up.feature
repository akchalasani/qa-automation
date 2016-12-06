####################################################################################################
# @Author: Sudhakar Mandati
# @Date: 12-02-2016
# @Organisation: Tekinroads
####################################################################################################

Feature: User Registration Functionality

  Scenario: Verify the new user registration
    Given I visit the good search home page
    When I click on sign In link then the join now link
    And I enter valued for all the mandatory fields in user registration page and click on sign me up
    Then I verify the registered user name in the good search home page
