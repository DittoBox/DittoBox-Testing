Feature: Create REST endpoint for user management
  As a developer,
  I want to create a REST endpoint for user account management
  So that users can register and manage their accounts.

  Scenario Outline: User registers or updates their account via REST endpoint
    Given the REST API for user management is available
    When the user sends a <requestType> request to <endpoint> with the following payload:
      | Field         | Value            |
      | userId        | <userId>         |
      | email         | <email>          |
      | password      | <password>       |
    Then the API should return a <responseCode> response
    And the account should be <action> successfully

    Examples:
      | requestType | endpoint       | userId | email               | password   | responseCode | action      |
      | POST        | /register      |        | john@example.com    | pass1234   | 201          | registered  |
      | PUT         | /updateAccount | 1001   | jane@example.com    | newpass567 | 200          | updated     |

  Scenario: User registers with an invalid email format
    Given the REST API for user management is available
    When the user sends a POST request to register with an invalid email
    Then the API should return a 400 Bad Request response
    And the error message should say "Invalid email format"
    And the user should not be registered

  Scenario: User tries to update account with missing password
    Given the REST API for user management is available
    When the user sends a PUT request to update their account without a password
    Then the API should return a 400 Bad Request response
    And the error message should say "Password is required"
    And the account should not be updated
