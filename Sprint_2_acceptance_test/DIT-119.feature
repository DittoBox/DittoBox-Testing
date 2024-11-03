Feature: View a restaurant in the mobile app
  As a user,
  I want to view a restaurant
  So that I can check its information.

  Scenario Outline: User views restaurant information
    Given the user is logged into the mobile app
    And the user has access to an existing restaurant
    When the user navigates to the restaurant details page
    Then the restaurant’s information should be displayed
    And it should match the following details:
      | restaurantName    | restaurantDescription       | containerCount | alertCount |
      | <restaurantName>  | <restaurantDescription>     | <containerCount> | <alertCount> |

    Examples:
      | restaurantName    | restaurantDescription    | containerCount | alertCount |
      | Restaurant Alpha  | Main development team    | 5              | 3          |
      | Restaurant Beta   | Testing and QA group     | 8              | 2          |

  Scenario: User tries to view a restaurant they do not have access to
    Given the user is logged into the mobile app
    And the user does not have access to the restaurant
    When the user attempts to view the restaurant
    Then the system should show an error message "Access denied"