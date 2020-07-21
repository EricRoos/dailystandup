Feature: Login
  Scenario: the user already exist
    Given the user exists
    And the user is on the home page
    When the user completes the Login Form
    And the user presses "Log in"
    Then the user should see "Signed in"
