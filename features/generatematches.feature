Feature: 
  As a user
  I want to click a button to generate matches
  and see a spinner
  so that I can wait for matches to be generated. 
  
  Scenario: Visit page
    #need help with automatic routing
    Given I am on "/generatematches/index"
    Then I should see "Click below"
    
  Scenario: Click button
    Given I am on "/generatematches/index" 
    When I press "Generate"
    Then I should see "calculating your matches in the background"
    