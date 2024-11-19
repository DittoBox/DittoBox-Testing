Feature: Update account information in the web app
  As a user,
  I want to update my account information
  So that I can keep my information up to date.

  Scenario Outline: Worker updates account information successfully
    Given the user is logged into the web app
    And the user is a worker
    When the user navigates to the account settings page
    And the user updates the following fields:
      | Field        | Value                |
      | <field>      | <value>              |
    Then the account information should be updated successfully
    And the user should receive a confirmation message

    Examples:
      | field        | value                |
      | Email        | newemail@example.com |
      | Username     | newusername          |
      | Password     | newpassword          |

  Scenario Outline: Owner updates account information successfully
    Given the user is logged into the web app
    And the user is an owner
    When the user navigates to the account settings page
    And the user updates the following fields:
      | Field               | Value                |
      | <field>             | <value>              |
    Then the account information should be updated successfully
    And the user should receive a confirmation message

    Examples:
      | field               | value                |
      | Company Name        | New Company          |
      | Identification Number | 123456789          |
      | Country             | New Country          |
      | City                | New City             |

  Scenario: User tries to update with invalid email format
    Given the user is logged into the web app
    When the user updates their email to an invalid format
    Then the system should display an error message "Invalid email format"
    And the account information should not be updated

  Scenario: User tries to update with invalid phone number
    Given the user is logged into the web app
    When the user updates their phone number to an invalid format
    Then the system should display an error message "Invalid phone number"
    And the account information should not be updated