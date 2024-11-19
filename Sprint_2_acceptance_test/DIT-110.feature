Feature: View account information in the mobile app
  As a user,
  I want to view my account information
  So that I can check the accuracy of my information.

  Scenario Outline: User views account information with various details
    Given the user is logged into the mobile app
    When the user navigates to the account information page
    Then the user should see their account details
    And the information should match the following details:
      | Field            | Value            |
      | Full Name        | <fullName>       |
      | Email            | <email>          |
      | Phone Number     | <phoneNumber>    |
      | Address          | <address>        |

    Examples:
      | fullName       | email                | phoneNumber   | address              |
      | John Doe       | john@example.com     | 1234567890    | 123 Main St          |
      | Jane Smith     | jane@example.com     | 0987654321    | 456 Oak Ave          |

  Scenario: User is not logged in and tries to view account information
    Given the user is not logged into the mobile app
    When the user attempts to navigate to the account information page
    Then the user should be redirected to the login page
    And the account information should not be displayed

  Scenario: User account information is not available
    Given the user is logged into the mobile app
    When the user navigates to the account information page
    And the server is down
    Then the user should see an error message "Account information is unavailable"
    And the user should be prompted to try again later
