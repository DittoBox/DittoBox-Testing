Feature: Revoke subscription privileges in the mobile app
  As a user,
  I want to revoke privileges from another user
  So that they cannot execute actions in the subscription configuration.

  Scenario Outline: User successfully revokes subscription privileges
    Given the user is logged into the mobile app
    And the user has admin privileges
    When the user revokes subscription privileges from <userName>
    Then <userName> should lose access to the following actions:
      | action                       |
      | Register containers          |
      | Add containers               |
      | Remove people from groups    |

    Examples:
      | userName   |
      | John Doe   |
      | Jane Smith |

  Scenario: User tries to revoke privileges without admin rights
    Given the user is logged into the mobile app
    But the user does not have admin privileges
    When the user attempts to revoke subscription privileges from another user
    Then the system should show an error message "Admin rights required"
    And the privileges should not be revoked