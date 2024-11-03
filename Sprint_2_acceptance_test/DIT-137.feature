Feature: Create a template in the mobile app
  As a user,
  I want to create a template
  So that I can set thresholds and alerts.

  Scenario Outline: User successfully creates a template
    Given the user is logged into the mobile app
    When the user navigates to the template creation page
    And the user enters valid template details
    Then the template should be created successfully
    And the user should be able to set thresholds and alerts

    Examples:
      | templateName   | category       | alertThreshold | alertType    |
      | High Temp      | Food Processed | 75°C           | Temperature  |
      | Low Pressure   | Fruits         | 5 Bar          | Pressure     |

  Scenario: User tries to create a template without setting a threshold
    Given the user is logged into the mobile app
    When the user navigates to the template creation page
    And the user submits without entering an alert threshold
    Then the system should show an error message "Threshold is required"
    And the template should not be created