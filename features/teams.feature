Feature: Team Management
  Scenario: Add a Team
    Given the user is logged in
    And is on the teams page
    When the user clicks on "Add Team"
    Then the user should see the New Team form
