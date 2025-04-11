Feature: view events

    As a logged-in student, I want to be able to go to the events page,
    so that I can view information on upcoming events

Background: logged in student, on landing page
    Given I logged in as a "Student"
    And I am on the landing page

Scenario: student should be able to see a link to events
    Then I should got "Events"

Scenario: student should be redirected to the events page after clicking "Events"
    When I click "Events"
    Then I should be on the events page
