Feature: navigate to admin dashboard

    As a logged-in admin, I want to be able to navigate to the admin dashboard from the landing page

Background: logged in admin, on landing page
    Given I logged in as a "Admin"
    And I am on the landing page

Scenario: admin should see a link to admin dashboard
    Then I should see "go to admin dashboard"

Scenario: admin should be able to follow the link and go to the admin dashboard
    When I follow "go to admin dashboard"
    And byebug
    Then I should be on the admin dashboard

Scenario: student should not be able to see the link to admin dashboard
    Given I logged in as "Student"
    And I am on the landing page
    Then I should not see "go to admin dashboard"

Scenario: student should have no permission to access admin dashboard
    Given I logged in as "Student"
    When I go to admin dashboard
    Then I should be on the landing page
    And I should see "you have no permission to access the page"