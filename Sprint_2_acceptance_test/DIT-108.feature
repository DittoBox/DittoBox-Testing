Feature: Grant subscription privileges in the mobile app
  As a user,
  I want to grant privileges to another user
  So that they can execute actions within the subscription account.

  Scenario Outline: User successfully grants subscription privileges
    Given the user is logged into the mobile app
    And the user has admin privileges
    When the user grants subscription privileges to <userName>
    Then <userName> should gain access to the following actions:
      | action                       |
      | Register containers          |
      | Add containers               |
      | Remove people from groups    |

    Examples:
      | userName   |
      | John Doe   |
      | Jane Smith |

  Scenario: User tries to grant privileges without admin rights
    Given the user is logged into the mobile app
    But the user does not have admin privileges
    When the user attempts to grant subscription privileges to another user
    Then the system should show an error message "Admin rights required"
    And the privileges should not be granted