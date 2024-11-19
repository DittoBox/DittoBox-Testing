Feature: Register a worker to a restaurant in the mobile app
  As a user,
  I want to register another user as a worker in a restaurant
  So that they can access the resources.

  Scenario Outline: User successfully registers a worker to a restaurant
    Given the user is logged into the mobile app
    And the user has an existing restaurant
    When the user selects a worker and assigns them to the restaurant
    Then the worker should have access to the restaurant’s resources

    Examples:
      | workerName    | restaurantName |
      | John Doe      | Restaurant Alpha |
      | Jane Smith    | Restaurant Beta  |

  Scenario: User tries to register a worker who is not in the system
    Given the user is logged into the mobile app
    When the user tries to assign a non-existent worker to the restaurant
    Then the system should show an error message "User not found"
    And the worker should not be assigned to the restaurant