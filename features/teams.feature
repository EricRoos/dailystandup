Feature: Team Management
  Scenario: Start Adding a Team 
    Given the user is logged in
    And is on the teams page
    When the user clicks on "Add Team"
    Then the user should see the New Team form

  Scenario: Add a team
    Given the user is logged in
    And the user is on the new team page
    When the user completes the New Team form
    And the user presses "Create Team"
    Then the user should see the teams name

