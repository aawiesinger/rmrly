Feature: Create user profile
  
  As a recently signed up user
  I want to be able to create a profile page

  Scenario: A returning user wants to create a profile
      Given I am on the create profile page
      When I fill in "name" with "name"
      And I fill in "age" with "22"
      And I press "Submit"
      Then I should be able to see my profile page