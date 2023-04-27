Feature: view course information
    As a logged-in student, I want to be able to go to the courses page,
    so that I can view course information

Background: logged in student, on landing page
    Given I logged in as a "Student"
    And I am on the landing page

Scenario: student should be able to see a link to scholarship information
    Then I should got "Our Courses"

Scenario: student should be redirected to the courses page after clicking "Our Courses"
    When I click "Our Courses"
    Then I should be on the courses page

Scenario: student should be able to go back to the landing page from courses page
    When I click "Our Courses"
    And I click "Back"
    Then I should be on the landing page