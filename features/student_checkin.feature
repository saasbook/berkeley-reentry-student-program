Feature: check in as a student

    As a logged-in student, I want to be able to checkin on the app,
    so that I can access the study space.

Background: logged in student, on landing page
    Given I logged in as a "Student"
    And I am on the landing page

Scenario: student should be able to check in
    Then I should see "Check-in"

Scenario: student should be redirect to the check-in page after clicking "Check-in"
    When I follow "Check-in"
    Then I should see "Please select a reason for check-in today"

Scenario: student should be able to fill in a reason and check-in (good path)
    When I follow "Check-in"
    And I choose "Peer Support"
    And I press "Submit"
    Then I should be on the landing page
    And I should see "Success!"

Scenario: student should not be able to check-in without filling in a reason (sad path)
    When I follow "Check-in"
    And I press "Submit"
    Then I should be on the checkin page

Scenario: student should be able to go back to landing page from checkin page
    When I follow "Check-in"
    And I press "Back"
    Then I should be on the landing page

Scenario: only student can checkin (admin can't access this feature)
    Given I logged in as a "Admin"
    And I am on the landing page
    Then I should not see "Check-in"