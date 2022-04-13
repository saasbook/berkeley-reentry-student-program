Feature: button to appointment page

    As a student,
    I want to see a button that takes me to the appointment page,
    so that I can make appointments with counselors.

Background: log in as student
    Given I logged in as a "Student"
    And I am on the landing page

Scenario: logged in student should see a "Go to apointment page" button
    Then I should got "Go to appointment page"

Scenario: The "Go to appointment page" button should take user to the appointment page
    When I click "Go to appointment page"
    Then I should be on the appointment page

Scenario: logged out user should be blocked when trying to access the appointment page
    Given I logged out
    When I go to the appointment page
    Then I should be on the landing page
    And I should see "Please log-in first!"
