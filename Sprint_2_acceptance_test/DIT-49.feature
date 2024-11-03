Feature: Implement REST endpoints for group management
  As a developer,
  I want to implement REST endpoints for group management
  So that users can create, edit, and delete groups.

  Scenario Outline: User creates, edits, or deletes a group via REST endpoint
    Given the REST API for group management is available
    When the user sends a <requestType> request to <endpoint> with the following payload:
      | Field      | Value         |
      | groupId    | <groupId>     |
      | groupName  | <groupName>   |
    Then the API should return a <responseCode> response
    And the group should be <action> successfully

    Examples:
      | requestType | endpoint        | groupId | groupName | responseCode | action     |
      | POST        | /createGroup    |         | Dev Team  | 201          | created    |
      | PUT         | /updateGroup    | 101     | DevOps    | 200          | updated    |
      | DELETE      | /deleteGroup    | 101     |           | 204          | deleted    |

  Scenario: User attempts to create a group with missing fields
    Given the REST API for group management is available
    When the user sends a POST request to create a group without a group name
    Then the API should return a 400 Bad Request response
    And the error message should say "Group name is required"
    And the group should not be created

  Scenario: User tries to delete a group that does not exist
    Given the REST API for group management is available
    When the user sends a DELETE request for a non-existent group
    Then the API should return a 404 Not Found response
    And the error message should say "Group not found"
