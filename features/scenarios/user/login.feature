Feature: User Login

Scenario: As a user I should be logged in when entering valid credentials
  Given I have a user account
  And I am at the user log in screen
  When I log in as a user
  Then I see "Success, you are logged in."
