Feature: View notifications in the web app
  As a user,
  I want to view the notifications that I receive in the web app
  So that I can stay informed about important updates.

  Scenario Outline: User views notifications successfully
    Given the user is logged into the web app
    When the user navigates to the notifications page
    Then the system should display the following notifications:
      | Notification Type  | Message                      |
      | <type>             | <message>                    |

    Examples:
      | type         | message                               |
      | Alert        | Your account has been updated.        |
      | Reminder     | Your subscription is about to expire. |
      | Warning      | Unusual activity detected.            |

  Scenario: No notifications are available
    Given the user is logged into the web app
    And there are no notifications
    When the user navigates to the notifications page
    Then the system should display a message "No notifications available"

  Scenario: User tries to view notifications without being logged in
    Given the user is not logged into the web app
    When the user attempts to navigate to the notifications page
    Then the system should show an error message "Please log in to view notifications"
    And the user should be redirected to the login page