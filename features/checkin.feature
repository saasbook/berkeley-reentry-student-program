Feature: check in as a student

    As a logged-in student, I want to be able to checkin on the app,
    so that I can access the study space.

Background: logged in student, on landing page
    Given I logged in as a "Student"
    And I am on the landing page

Scenario: student should be able to check in
    Then I should got "Check-in"

Scenario: student should be redirect to the check-in page after clicking "Check-in"
    When I click "Check-in"
    Then I should see "Please select a reason for check-in today"

Scenario: student should be able to fill in a reason and check-in (good path)
    When I click "Check-in"
    And I select "Peer Support" from "checkin_reason"
    And I press "Submit"
    Then I should be on the landing page
    And I should see "Success!"

Scenario: student should not be able to check-in without filling in a reason (sad path)
    When I click "Check-in"
    And I click "Submit" in checkin
    Then no checkin record should be created

Scenario: student should be able to go back to landing page from checkin page
    When I click "Check-in"
    And I click "Back"
    Then I should be on the landing page
