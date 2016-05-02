Feature: Listing accomodations
  After I logging I should be able to
  Navigate to accomodations list
  and see items

  Scenario: Sends a contact message
    Given That I logged in as user
    And I am on dashobard page
    When I click on "accomodations_nav" link
    Then I see in accomodations grid my accomodations items