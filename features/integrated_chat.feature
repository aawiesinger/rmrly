Feature: Get to the chat page and chat with a user
  
    As a user
    I want to be able to chat with other users I have matched with
    So we can get to know each other
    
Background: Some users who have matched with each other already exist, and they have exchanged some messages
   Given the user with username "user1" and matches "user2" and password "jfkdlsajklfds" and email "123@fdsaf.com" exists
  And the user with username "user2" and matches "user1" and password "jfkdlsajklfds" and email "123324@fdsaf.com" exists
  And the following messages exist:
    | to_user   | from_user | body      |
    | user1     | user2     | hey       |
    | user2     | user1     | hi        |
    | user1     | user2     | wanna be roommates |
    | user2     | user1     | sure      |
    | user2     | user1     | lets do it|

Scenario: I should be able to get to the chat page and see the messages between me and user2 when logged in as user1
    Given I am on the login page
  When I fill in "Email" with "123@fdsaf.com"
  And I fill in "Password" with "jfkdlsajklfds"
  And I press "Log in"
  And I follow Matches
  And I follow Chat
  Then I should see "hey" before "hi"
  And I should see "hi" before "wanna be roommates"
  And I should see "wanna be roommates" before "sure"
  And I should see "sure" before "lets do it"
  