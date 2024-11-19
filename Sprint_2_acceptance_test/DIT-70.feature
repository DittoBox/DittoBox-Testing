Feature: View container status in the web app
  As a user,
  I want to view the status of a container
  So that I can check its information.

  Scenario Outline: User successfully views container status
    Given the user is logged into the web app
    When the user navigates to the container status page
    Then the container status should be displayed with the following details:
      | containerId | status        |
      | <containerId> | <status>    |

    Examples:
      | containerId | status         |
      | 12345       | Active         |
      | 67890       | Inactive       |

  Scenario: User tries to view a container that does not exist
    Given the user is logged into the web app
    When the user attempts to view a non-existent container
    Then the system should show an error message "Container not found"
