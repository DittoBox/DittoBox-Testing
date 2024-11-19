Feature: Create a template in the web app
  As a user,
  I want to create a template
  So that I can set thresholds and alerts for container data.

  Scenario Outline: User creates a template successfully
    Given the user is logged into the web app
    When the user navigates to the template creation page
    And the user enters the following details:
      | Template Name  | Category       | Temperature Threshold | Humidity Threshold | Oxygen Threshold | CO2 Threshold | Ethylene Threshold | Ammonia Threshold | SO2 Threshold | Alert Type     |
      | <name>         | <category>     | <tempThreshold>       | <humidityThreshold>| <oxygenThreshold>| <co2Threshold>| <ethyleneThreshold>| <ammoniaThreshold>| <so2Threshold>| <alert>        |
    Then the template should be created successfully
    And it should appear in the template list

    Examples:
      | name             | category       | tempThreshold | humidityThreshold | oxygenThreshold | co2Threshold | ethyleneThreshold | ammoniaThreshold | so2Threshold | alert            |
      | Temp Template    | Food Processed | 5°C           | 60%               | 21%             | 0.04%        | 0.001%            | 0.0005%          | 0.0001%      | Email            |
      | Humidity Template| Fruits         | 8°C           | 65%               | 20.9%           | 0.05%        | 0.002%            | 0.0006%          | 0.0002%      | Push Notification|

  Scenario: User tries to create a template without a name
    Given the user is logged into the web app
    When the user navigates to the template creation page
    And the user leaves the template name field empty
    Then the system should display an error message "Template name is required"
    And the template should not be created

  Scenario: User tries to create a template with invalid thresholds
    Given the user is logged into the web app
    When the user navigates to the template creation page
    And the user enters invalid threshold values
    Then the system should display an error message "Invalid threshold values"
    And the template should not be created