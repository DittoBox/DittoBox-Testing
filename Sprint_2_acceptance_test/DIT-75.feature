Feature: Load a template to a container in the web app
  As a user,
  I want to load a template to a container
  So that I can set its conditions, thresholds, and alerts.

  Scenario: User loads a template to modify container settings
    Given the user is logged into the web app
    And the user navigates to the templates section
    When the user selects a template from the list
    And a sidenav opens to configure the template
    And the user chooses containers to be modified
    Then the system should display a confirmation message "Template successfully applied to selected containers"
    And the selected containers should now reflect the template's conditions, thresholds, and alerts

  Scenario Outline: User applies a specific template to multiple containers
    Given the user is logged into the web app
    And the user navigates to the templates section
    When the user selects the "<templateName>" template
    And a sidenav opens with options to select containers
    And the user selects the following containers:
      | Container ID |
      | <containerId1> |
      | <containerId2> |
    Then the system should apply "<templateName>" template settings to all selected containers
    And each container should display the updated conditions, thresholds, and alerts as per "<templateName>"

    Examples:
      | templateName       | containerId1 | containerId2 |
      | Temperature Alert  |    12345     |    54321     |
      | Humidity Threshold |    67890     |    98765     |

  Scenario: User attempts to apply a template without selecting any container
    Given the user is logged into the web app
    And the user navigates to the templates section
    When the user selects a template from the list
    And a sidenav opens with options to select containers
    And the user does not select any container
    Then the system should display an error message "Please select at least one container to apply the template"