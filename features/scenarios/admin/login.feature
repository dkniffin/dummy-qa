Feature: Admin Login

  Scenario: As an admin I should be logged in when entering valid credentials
    Given I have an admin account
    And I am at the admin log in page
    When I log in as an admin
    Then I am in the admin panel
