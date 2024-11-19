Feature: Configure Container thresholds in the web app
  As a user,
  I want to configure the thresholds of a template
  So that I can set alerts.

  Scenario: User configures thresholds manually for a selected container
    Given the user is logged into the web app
    And the user navigates to the containers section
    When the user selects a specific container
    And a sidenav opens with options for the selected container
    And the user chooses to modify thresholds manually
    Then a modal should appear allowing the user to configure thresholds
    When the user sets the following threshold values:
      | Condition     | Threshold |
      | Temperature   | 5°C - 25°C |
      | Humidity      | 30% - 70% |
      | CO2           | 0% - 0.05% |
      | Oxygen        | 19% - 23% |
    And the user saves the changes
    Then the system should display a confirmation message "Thresholds updated successfully"
    And the container should reflect the updated threshold values

  Scenario Outline: User sets customized thresholds for various conditions
    Given the user is logged into the web app
    And the user navigates to the containers section
    When the user selects a container with ID "<containerId>"
    And a sidenav opens with options for that container
    And the user chooses to configure thresholds manually
    Then a modal should open for threshold configuration
    When the user sets thresholds for:
      | Condition     | Minimum | Maximum |
      | Temperature   | <tempMin> | <tempMax> |
      | Humidity      | <humidityMin> | <humidityMax> |
      | CO2           | <co2Min> | <co2Max> |
      | Oxygen        | <oxygenMin> | <oxygenMax> |
    And the user saves the configuration
    Then the system should save the thresholds for "<containerId>"
    And display a confirmation message "Custom thresholds saved for container <containerId>"

    Examples:
      | containerId | tempMin | tempMax | humidityMin | humidityMax | co2Min | co2Max | oxygenMin | oxygenMax |
      | 12345      | 5°C     | 25°C    | 30%         | 70%         | 0%     | 0.05%  | 19%       | 23%       |
      | 54321      | 4°C     | 24°C    | 35%         | 65%         | 0.01%  | 0.04%  | 20%       | 22%       |

  Scenario: User attempts to save thresholds without setting any value
    Given the user is logged into the web app
    And the user navigates to the containers section
    When the user selects a container to configure thresholds manually
    And a sidenav opens with options
    And the user selects the option to modify thresholds manually
    Then a modal should appear for threshold configuration
    When the user does not set any values and tries to save
    Then the system should display an error message "Please enter valid threshold values before saving"