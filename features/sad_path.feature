Feature: Sad paths for various of cucumber tests

    Those sad paths all have different setup than the background,
    so they are combined in here.

Scenario: student should not be able to see the link to admin dashboard
    Given I logged in as a "Student"
    And I am on the landing page
    Then I should not got "go to admin dashboard"

Scenario: student should have no permission to access admin dashboard
    Given I logged in as a "Student"
    And I go to the admin dashboard
    Then I should be on the landing page
    And I should see "You don't have the permission to do that!"

Scenario: only student can checkin (admin can't access this feature)
    Given I logged in as a "Admin"
    And I am on the landing page
    Then I should not got "Check-in"