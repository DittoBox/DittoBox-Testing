Feature: View container inner conditions in the web app
  As a user,
  I want to view the inner conditions of a container
  So that I can check its information.

  Scenario Outline: User views the inner conditions of a container
    Given the user is logged into the web app
    When the user navigates to the container conditions page
    Then the system should display the following conditions:
      | Container ID | Temperature | Humidity | Pressure | Oxygen | CO2 | Ethylene | Ammonia | SO2 |
      | <containerId>| <temp>      | <humidity> | <pressure> | <oxygen> | <co2> | <ethylene> | <ammonia> | <so2> |

    Examples:
      | containerId | temp  | humidity | pressure | oxygen | co2 | ethylene | ammonia | so2 |
      | C12345      | 5°C   | 60%      | 1013 hPa | 21%    | 0.04% | 0.001% | 0.0005% | 0.0001% |
      | C54321      | 8°C   | 65%      | 1010 hPa | 20.9%  | 0.05% | 0.002% | 0.0006% | 0.0002% |

  Scenario: User tries to view inner conditions for a container that is not being monitored
    Given the user is logged into the web app
    When the user searches for a container without monitoring data
    Then the system should display an error message "No monitoring data available"