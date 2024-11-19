Feature: Change language in the web app
  As a user,
  I want to change the language of my web app
  So that I can use the interface in my preferred language.

  Scenario Outline: User changes the language successfully
    Given the user is logged into the web app
    When the user navigates to the language settings page
    And the user selects <language>
    Then the web app interface should update to <language>

    Examples:
      | language   |
      | English    |
      | Spanish    |

  Scenario: User tries to change to an unsupported language
    Given the user is logged into the web app
    When the user selects an unsupported language
    Then the system should display an error message "Language not supported"
    And the language should not be changed