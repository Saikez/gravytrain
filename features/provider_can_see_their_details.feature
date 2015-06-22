Feature: Provider can view their Profile
  As a Provider
  I want to see my registered information
  So that I verify they are correct

  Scenario: A Provider account is created
    Given my Provider profile exists
    When I am on my provider profile page
    Then I see my details

  Scenario: Viewing a provider's events
    Given a registered provider with events
    When I view the provider's events
    Then I see a list of events offered by the provider
