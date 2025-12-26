@Regression @CampaignManager @AccountSelection
Feature: Account Selection Validation
  In order to ensure Account Selection functionality in Campaign Manager
  As a tester
  I want to verify the login to Campaign Manager
  and landed on Account Selection page.

  Background:
    Given the user launches the Campaign Manager application
    And the user enters valid username and password
      | username           | password     |
      | sundars@rewike.com | Sundar@12345 |
    And clicks "log In" button

  @Smoke @Positive
  Scenario: Verify the AccountSelection page redirection after login
    Then the user should be redirected to the 'Select an Account' page
    And the user should see the following elements on the 'Select an Account' page:
      | Element              |
      | Account dropdown     |
      | Account list         |
      | Go to Sampler button |
      | Logout button        |

  @Positive
  Scenario: Select required account and validate Campaign Manager dashboard page redirection
    When the user selects required account 'BJs' from the account dropdown
    And clicks "Go to Sampler" button
    Then the user should be redirected to the Campaign Manager dashboard page

  @Negative
  Scenario: Validate the warning message when no account is selected and 'Go to Sampler' button is clicked
    When the user does not select any account from the account dropdown
    And clicks "Go to Sampler' button
    Then the user should see a warning message 'Please select an account to proceed.'
