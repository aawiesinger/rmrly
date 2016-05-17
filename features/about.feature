Feature: View about page for Rmrly
  
    As a user
    I want to be able to get more information about what Rmrly is
    So that I can know why anyone would use Rmrly
  
    Scenario: A user visits the About page
        Given I am on the homepage
        When I follow About
        Then I should be on the about page
        And I should see "rmrly: room-really"
        And I should see "Are you looking for a roommate? Stop googling, and let rmrly do the work! rmrly is a roommate matching app for students at Binghamton University."
        