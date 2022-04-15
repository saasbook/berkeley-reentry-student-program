Feature: navigate to admin dashboard

    As a logged-in admin, I want to be able to navigate to the admin dashboard from the landing page

Background: logged in admin, on landing page
    Given I logged in as a "Admin"
    And I am on the landing page

#Scenario: admin should see a link to admin dashboard
#    Then I should got "Go to admin dashboard"
#
#Scenario: admin should be able to follow the link and go to the admin dashboard
#    When I click "Go to admin dashboard"
#    Then I should be on the admin dashboard
