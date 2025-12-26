@Regression @Sanity @CampaignManager @Login
Feature: User Login Validation
  In order to ensure secure and valid access to the Campaign Manager QA Application
  As a tester
  I want to verify the login functionality using valid and invalid credentials

  Background:
    Given the user launches the Campaign Manager application
    And the user is on the login page

  @Smoke @Positive
  Scenario: Successful login with valid credentials
    When the user enters valid username and password
      | username           | password     |
      | sundars@rewike.com | Sundar@12345 |
    And the user clicks "log In" button
    Then the user should be redirected to the 'Select an Account' page

  @Negative
  Scenario: Unsuccessful login with invalid credentials
    When the user enters an invalid username or password
    And the user clicks "log In" button
    Then an error message should be displayed indicating invalid credentials

  @Negative
  Scenario: Attempt to login with empty credentials
    When the user clicks on the login button without entering any credentials (Duplicate for review)
    And the user clicks "log In" button
    Then an error message should be displayed indicating that both fields are required

  @Smoke @Positive
  Scenario: Password should be masked during entry
    When the user types characters in the password field
    Then the entered password should be masked and not visible

  @Positive
  Scenario: User session timeout after inactivity
    Given the user has logged in successfully
    When the user remains inactive for a predefined period (e.g., 10 minutes)
    Then the system should automatically log the user out
    And redirect the user to the login page
