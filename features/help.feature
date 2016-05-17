Feature: View help page for Rmrly
  
    As a user
    I want to be able to have assistance
    So that I can properly use Rmrly
  
    Scenario: A user visits the Help page
        Given I am on the homepage
        When I follow Help
        Then I should be on the help page
        And I should see "FAQ: How do I set up an account? "
        
        