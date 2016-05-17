Feature: Receiving messages sent by another user
    
    As a user
    I want to be able to see messages another user has sent me
    So we can message back and forth

Background: Some users who have matched with each other already exist
   Given the user with username "user1" and matches "user2" and password "jfkdlsajklfds" and email "123@fdsaf.com" exists
  And the user with username "user2" and matches "user1" and password "jfkdlsajklfds" and email "123324@fdsaf.com" exists

Scenario: If I send a message to a user then the other user should see it
   Given I am on the login page
  When I fill in "Email" with "123@fdsaf.com"
  And I fill in "Password" with "jfkdlsajklfds"
  And I press "Log in"
  And I follow Matches
  And I follow Chat
  And I fill in "message_body" with "this is a new message"
  And I press "Send"
  And I follow Log out
  And I am on the login page
  And I fill in "Email" with "123324@fdsaf.com"
  And I fill in "Password" with "jfkdlsajklfds"
  And I press "Log in"
  And I follow Matches
  And I follow Chat
  Then I should see "this is a new message"