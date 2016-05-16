Feature: View contact page for Rmrly
  
    As a user
    I want to be able to contact the developers who made the site
    So that I can communicate my thoughts about Rmrly effectively
  
    Scenario: A user visits the Contact page
        Given I am on the homepage
        When I follow Contact
        Then I should be on the contact page
        And I should see "This is the hardworking dedicated team that built you rmrly:"