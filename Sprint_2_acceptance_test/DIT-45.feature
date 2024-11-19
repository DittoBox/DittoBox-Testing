Feature: Upgrade a subscription in the web app
  As a user,
  I want to upgrade my subscription
  So that I can access more features.

  Scenario Outline: User upgrades subscription with valid and invalid details
    Given the user is logged into the web app
    When the user navigates to the subscription upgrade page
    And selects the <subscriptionTier> upgrade
    Then the system should <outcome> the upgrade process
    And the user's subscription should be <subscriptionStatus>

    Examples:
      | subscriptionTier | outcome        | subscriptionStatus |
      | Premium          | upgrade        | active            |
      | Enterprise       | upgrade        | active            |
      | Free             | show error     | unchanged         |
      | Invalid          | show error     | unchanged         |
