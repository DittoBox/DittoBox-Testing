Feature: Create a restaurant in the mobile app
  As a user,
  I want to create a restaurant
  So that I can organize my resources.

  Scenario Outline: User successfully creates a restaurant
    Given the user is logged into the mobile app
    When the user navigates to the restaurant creation page
    And the user enters valid restaurant details
    Then the restaurant should be created successfully
    And the restaurant should appear in the user's restaurant list

    Examples:
      | restaurantName   | restaurantDescription |
      | Restaurant Alpha | Main development team  |
      | Restaurant Beta  | Testing and QA group   |

  Scenario: User tries to create a restaurant with missing details
    Given the user is logged into the mobile app
    When the user navigates to the restaurant creation page
    And the user submits without entering a restaurant name
    Then the system should show an error message "Restaurant name is required"
    And the restaurant should not be created

  Scenario: User creates a restaurant with a duplicate name
    Given the user is logged into the mobile app
    When the user navigates to the restaurant creation page
    And the user enters a restaurant name that already exists
    Then the system should show an error message "Restaurant name already exists"
    And the restaurant should not be created