Feature: Generate roommate matches
    As a user
    I want to click a button to generate matches
    So that I can see people that I am compatible with
  
    Background: The user has signed up to Rmrly
  
    Scenario: A new user generates matches and has matches
      Given I am on the matches page for the user with the name "user4"
      When I press "Generate matches!"
      Then I should be on the matches page for the user with the name "user4"
      Then I should see "user5"
      And I should not see "user6"
      And I should not see "user4"
          
    Scenario: A new user generates matches and does not have any matches
      Given I am on the matches page for the user with the name "user6" 
      When I press "Generate matches!"
      Then I should see "Looks like you don't have any matches yet :( Try generating some!"
      And I should not see "user4"
      And I should not see "user5"