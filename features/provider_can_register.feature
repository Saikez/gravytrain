Feature: Provider can register
  As a Provider
  I want to register
  So that I can sell my Events

  Scenario: A Provider account is created
    Given no Providers exist
    When I am on the registration page
    And I complete the required fields
    And I submit my information
    Then my Provider account is created
    And I see a confirmation message
    But my account is unconfirmed
    And I receive a confirmation email

  Scenario: Confirming my Provider account
    Given I have registered
    When I follow the link within my confirmation email
    Then my account is confirmed
    And I am directed to my profile

  Scenario: A Provider does not accept the terms
    Given no Providers exist
    When I am on the registration page
    And I complete the required fields
    And I do not check the Accepted terms checkbox
    And I submit my information
    Then my Provider account is not created
    And I see an error message
