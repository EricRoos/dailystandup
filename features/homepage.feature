Feature: Loading the front page
  Scenario: Not Logged in
    When I visit the home page
    Then I see the "Login" form
