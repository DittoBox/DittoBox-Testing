Feature: View account information in the web app
  As a user,
  I want to view my account information
  So that I can check the accuracy of my information.

  Scenario: User views personal and account information
    Given the user is logged into the web app
    When the user navigates to the account section
    Then the system should display the following user information:
      | Field                   | Value             |
      | Username                | A warm place      |
      | Name                    | Advance           |
      | Identification number   | 20124578963       |
      | Bank account owner      | Sofía Pérez       |
    And the system should display the following account information:
      | Field                   | Value             |
      | Business name           | A warm place      |
      | Subscription tier       | Advance           |
      | Identification number   | 20124578963       |
    And options should be available to "Edit data" and "Change password"
    And an option should be available to "Manage Subscription"