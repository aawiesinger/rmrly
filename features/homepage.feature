Feature: View homepage for Rmrly
  As a new user with or without an account
  So that I may read about what Rmrly is
  I want to see the homepage for Rmrly
  
  Scenario: A user visits the homepage
    Given I am on "/"
    Then I should see "Sign up"
    And I should see "rmrly is an app that matches students looking for a place to live with other students based on survey questions"
    