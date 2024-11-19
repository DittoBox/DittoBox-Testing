Feature: Implement email service integration
  As a developer,
  I want to implement email service integration
  So that I can send notifications and alerts to users.

  Scenario Outline: Email service sends different types of notifications
    Given the email service is integrated with the app
    When a <notificationType> is triggered
    Then an email should be sent to the user with the following details:
      | Subject                    | Content                         |
      | <subject>                  | <content>                       |
    And the user should receive the email within a reasonable time

    Examples:
      | notificationType | subject                  | content                             |
      | Alert            | Account Alert            | Your account has been updated       |
      | Welcome          | Welcome to DittoBox      | Thank you for signing up            |
      | Password Reset   | Password Reset Request   | Click here to reset your password   |

  Scenario: Email service fails to send notification due to server error
    Given the email service is integrated with the app
    When a notification is triggered
    And the email server is down
    Then no email should be sent to the user
    And the system should log the error "Email service unavailable"
    And the user should receive an in-app notification about the failure
