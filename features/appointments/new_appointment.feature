Feature: appointment page

    As a Student,
    I want to make Appointments with Staffs in the program,
    so that I can get advice / suggestion from them

Background: A student on the appointment page
    Given Time is freezed
    Given I logged in as a "Student"

Scenario: student should see a button to appointment page on the landing page
    Given I am on the landing page
    Then I should got "Go to appointment page"

Scenario: student should be redirected to the appointment page by clicking the "Go to appointment page" button
    Given I am on the landing page
    When I click "Go to appointment page"
    Then I should be on the appointment page

Scenario: student should see his/her upcoming appointment if he/she has one
    Given I have an appointment in "2" hours
    And I am on the appointment page
    Then I should see an appointment in "2" hours under upcoming appointments section

Scenario: student should see his/her upcoming appointment if he/she has none
    Given I have no upcoming appointment
    And I am on the appointment page
    Then I should see "You don't have any upcoming appointment!"

Scenario: clicking "book a new appointment" button
    Given I am on the appointment page
    When I click "Book a new appointment"
    And byebug
    Then I should be on the appointments student profile check page


