Feature: Set up CI/CD pipelines for automated testing, deployment, and monitoring
  As a developer,
  I want to have automatically deployed services
  So that I can speed up my productivity and allow other developers to consume the services I develop.

  Scenario Outline: Automated deployment through CI/CD pipelines
    Given the CI/CD pipeline is configured for the project
    When the developer pushes new changes to the repository
    Then the pipeline should automatically run <testType>
    And the application should be deployed to the <environment> environment
    And the monitoring service should track the deployment status

    Examples:
      | testType         | environment   |
      | unit tests       | staging       |
      | integration tests| production    |
      | acceptance tests | testing       |

  Scenario: CI/CD pipeline fails due to incorrect configuration
    Given the CI/CD pipeline is configured for the project
    When the developer pushes new changes with a broken test
    Then the pipeline should fail
    And the system should log the error "Test failure"
    And the application should not be deployed
