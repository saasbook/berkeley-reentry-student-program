Feature: Log in as different type of user

    As a logged-out user, I want to be able to log in,
    so that I can access my features of the app.

Background: logged out user, on landing page (never logged in before)
    Given I am on the landing page

Scenario: student should be able to log in
    Then I should got "Login with Google"

Scenario: prompt to input more personal info only at first time log in
    When I click "Login with Google" 
    Then I should be on the confirm page
    And I should see "Please Verify All the information below"

    When I fill in "Student ID" with "1234567890"
    And I click "Submit"
    Then I should be on the profile creation page
    And I should see "Let's get to know you a bit more..."

    When I click "Skip"
    Then I should be on the landing page
    And I should got "Check-in"

    When I click "Logout"
    Then I should be on the landing page
    When I click "Login with Google" 
    Then I should be on the landing page
    And I should got "Check-in"

Scenario: clicking submit without filling out all fields in confirm page (sad path)
    When I click "Login with Google" 
    Then I should be on the confirm page
    When I click "Submit"
    Then I should be on the confirm page

#Scenario: logging in as admin should direct to admin dashboard
#    When I am a "Admin"
#    And I click "Login with Google"
#    Then I should be on the landing page
#    And I should got "admin dashboard"
