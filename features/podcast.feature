Feature: view podcast information

    As a logged-in student, I want to be able to go to the scholarships page,
    so that I can view scholarship information

Background: logged in student
    Given I logged in as a "Student"

Scenario: View the podcast page
    Given I am on the podcast page
    Then I should see "Listen Now"