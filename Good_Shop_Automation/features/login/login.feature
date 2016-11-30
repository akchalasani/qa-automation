Feature: Good Search Signin functionality

  Scenario: Verify Signin functionality
    Given I visit the Goodshop home page
    And I click on Sign In link
    When I enter valid credentials and click on log in
    Then I should be able to see the loged in user name
    And I click on site merchant link and verify the links present
    Then I signout from the good search account


    @create_cause
  Scenario: Verify Signin functionality and create cause
    Given I visit the Goodshop home page
    And I click on create cause
    And I click on sign at the bottom and login
    When I enter valid credentials and click on log in
    And I should be able to see the loged in user name
    Then I signout from the good search account


#    Scenario: Verify the good search functionality
#      Given I visit the Goodshop home page
#      And I click on Sign In link
#      And I enter valid credentials and click on log in
#      When I perform some search under websearch
#      And I verify the donation which is inceresed on login user accoiunt
#      Then I signout from the good search account

