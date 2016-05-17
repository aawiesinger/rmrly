Feature: View homepage for Rmrly
  As a new user with or without an account
  So that I may read about what Rmrly is
  I want to see the homepage for Rmrly
  
  Scenario: A user visits the homepage
    Given I am on the homepage
    Then I should see "Sign up"
    And I should see "rmrly Home Help About Log in Welcome to rmrly Welcome to rmrly!"
    