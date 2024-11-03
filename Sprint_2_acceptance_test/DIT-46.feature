Feature: Downgrade a subscription in the web app
  As a user,
  I want to downgrade my subscription
  So that I can access fewer features.

  Scenario: User downgrades subscription and reviews feature losses
    Given the user is logged into the web app
    And the user navigates to the subscription section
    When the user selects the "Downgrade plan" option
    Then a confirmation modal should appear with details on feature losses
    And the modal should display:
      | Feature      | Usage         | Loss of Access                |
      | Facilities   | 4 out of 5    | "You'll lose access to 2 facilities" |
      | Containers   | 12 out of 25  | "You'll lose access to 2 containers" |
      | Users        | 7 out of 10   | "You'll lose access to 2 users"      |
    When the user confirms by selecting "Downgrade"
    Then the system should process the downgrade action
    And the system should display a success message "Subscription downgraded successfully"
    And the user should have access to the Free plan with limited features

  Scenario: User cancels the subscription downgrade
    Given the user is logged into the web app
    And the user navigates to the subscription section
    When the user selects the "Downgrade plan" option
    Then a confirmation modal should appear with details on feature losses
    When the user selects "Cancel" on the modal
    Then the system should close the modal
    And the user's subscription should remain unchanged