Feature: Listing accomodations
  After I logging I should be able to
  Navigate to accomodations list
  and see items

  Scenario: User go to accomodations list to preview his accomodations
    Given There is unauthorized customer with accomodation
    When User log in
    Then User see dashboard page
    When User Click on "accomodations_nav" link
    Then User see in accomodations grid accomodations items
    And User logs out

  Scenario: Adds new accomodation record
    Given There is unauthorized customer without accomodation
    When User log in
    Then User see dashboard page
    When User visits "/customers/dashboard"
    And Click on "accomodations_nav" link
    And Click on "add_accomodation" button
    Then User see add new accomodation screen
    When User fill "name" input with "my_accomodation"
    And Select accomodation type "flat"
    And User Fill "address_1" input with "My address 1"
    And User Fill "address_2" input with "My address 2"
    And User Fill "city" input with "My city"
    And User Fill "zip" input with "000000000"
    When Click submit button
    Then User is redirected to accomodations list
    And See newly added accomodation data
    And User logs out

   Scenario: Should prevent from adding invalid accomodation record
    Given There is unauthorized customer without accomodation
    When User log in
    Then User see dashboard page
    When User visits "/customers/dashboard"
    And Click on "accomodations_nav" link
    And Click on "add_accomodation" button
    Then User see add new accomodation screen
    When Click submit button
    Then For "name" field error should be shown
    And For "address_1" field error should be shown
    And For "address_2" field error should be shown
    And For "city" field error should be shown
    And For "zip" field error should be shown
    And Submit button should be disabled
    When User fill "name" input with "my_accomodation"
    Then "name" error disappear
    When User Fill "address_1" input with "My address 1"
    Then "address_1" error disappear
    When User Fill "address_2" input with "My address 2"
    Then "address_2" error disappear
    When User Fill "city" input with "My city"
    Then "city" error disappear
    When User Fill "zip" input with "000000000"
    Then "zip" error disappear
    And Submit button should be enabled
    When Click submit button
    Then User is redirected to accomodations list
    And See newly added accomodation data
    And User logs out

