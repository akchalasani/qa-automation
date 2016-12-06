####################################################################################################
# @Author: Sudhakar Mandati
# @Date: 11-30-2016
# @Organisation: Tekinroads
####################################################################################################
Feature: Verify the functionality of the verticals and the links present under verticals

#  Background: Given I visit the good search home page

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

  Scenario: Verify the functionality of the links which are present under grocery menu drop down
    Given I visit the good search home page
    And I click on grocery menu drop down and verify the links present
    Then I verify the grocery page by clicking on each link present under grocery menu drop down


  Scenario: Verify goodshop give functionality
    Given I visit the good search home page
    And I click on goodshop give tab and verify the page displayed
    Then I verify the support cause and create cause links functionality