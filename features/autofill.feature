Feature: Autofill check-in reason
  As a student using the check-in system
  I want my check-in reason to be pre-filled
  So that I can check in more quickly

  Background: logged in student
    Given I logged in as a "Student"
    And I am on the landing page

  Scenario: New user sees default reason
    When I click "Check-in"
    Then the reason dropdown should show "Peer Support"

  Scenario: Returning user sees last used reason
    Given I have previously checked in for "Studying"
    When I click "Check-in"
    Then the reason dropdown should show "Studying"