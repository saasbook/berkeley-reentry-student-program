Feature: navigate to admin dashboard sad path

    As a non admin, I won't be able to see / access admin dashboard

Scenario: student should not be able to see the link to admin dashboard
    Given I logged in as a "Student"
    And I am on the landing page
    Then I should not got "go to admin dashboard"

Scenario: student should have no permission to access admin dashboard
    Given I logged in as a "Student"
    And I go to the admin dashboard
    Then I should be on the landing page
    And I should see "You don't have the permission to do that!"

