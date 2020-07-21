Feature: Loading the front page
  Scenario: Not Logged in
    When the user is on the home page
    Then the user sees the "Login" form
