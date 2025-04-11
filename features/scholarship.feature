Feature: view scholarship information

    As a logged-in student, I want to be able to go to the scholarships page,
    so that I can view scholarship information

Background: logged in student, on landing page
    Given I logged in as a "Student"
    And I am on the landing page

Scenario: student should be able to see a link to scholarship information
    Then I should got "Re-entry Scholarships"

Scenario: student should be redirected to the scholarships page after clicking "Re-entry Scholarships"
    When I click "Re-entry Scholarships"
    Then I should be on the scholarships page

Scenario: student should be able to go back to the landing page from scholarships page
    When I click "Re-entry Scholarships"
    And I click "Back"
    Then I should be on the landing page