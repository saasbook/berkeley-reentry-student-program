Feature: checkin sad path

    As a non student, I won't be able to see button to checkin page

Scenario: only student can checkin (admin can't access this feature)
    Given I logged in as a "Admin"
    And I am on the landing page
    Then I should not got "Check-in"