@selenium
Feature: Accessibility Testing
  As a visitor of the website
  I want all pages I visit to be WCAG 2.0 AA compliant
  So that the website is accessible to everyone, including those with disabilities

  Scenario: Check landing page accessibility
    Given I am on the landing page
    Then the page should be axe clean

  Scenario: Check checkin page accessibility
    Given I am on the checkin page
    Then the page should be axe clean

  Scenario: Check appointments page accessibility
    Given I am on the appointments page
    Then the page should be axe clean

  Scenario: Check scholarships page accessibility
    Given I am on the scholarships page
    Then the page should be axe clean

  Scenario: Check courses page accessibility
    Given I am on the courses page
    Then the page should be axe clean

  Scenario: Check events page accessibility
    Given I am on the events page
    Then the page should be axe clean

  Scenario: Check create new user profile page accessibility
    Given I am on the user_profile_new page
    Then the page should be axe clean

  Scenario: Check user profile edit page accessibility
    Given I am on the user_profile_edit page
    Then the page should be axe clean

  Scenario: Check admins page accessibility
    Given I am on the admins page
    Then the page should be axe clean

  Scenario: Check view checkin records page accessibility
    Given I am on the view_checkin_records page
    Then the page should be axe clean

  Scenario: Check admin events page accessibility
    Given I am on the admin_events page
    Then the page should be axe clean
  
  Scenario: Check admin new event page accessibility
    Given I am on the new_admin_event page
    Then the page should be axe clean
