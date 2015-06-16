Feature: Provider can view their Profile
  As a Provider
  I want to see my registered information
  So that I verify they are correct

  Scenario: A Provider account is created
    Given my Provider profile exists
    When I am on my provider profile page
    Then I see my Name
    And I see my Address
    And I see my Postcode
    And I see my About me information
    And I see my Paypal email
