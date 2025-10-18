@Regression @CampaignManager @Sampling @SamplingWorkflow
Feature: Sampling Workflow Validation
In order to validate the Sampling Workflow
  As a QA Tester
  I want to login to Campaign Manager and
  I want to create a new Sampling and manage product samples
  So, that I can track and organize sample inventory

  Background:
    Given the recognized user is on Campaign Manager dashboard page
    And clicks 'Sampling' menu

  @Positive
  Scenario: Create new sample with required fields
    Given the user clicks on 'Create New' button
    And the user is on the New Sampling page
    When the user selects required value 'Random' from the 'Brand Name' dropdown
    And the user enters required 'string' value 'Random' in the 'Sample Product Name' text box
    And the user enters required 'string' value 'Random' in the 'Description' text box
    And the user enters required 'int' value 'Random' in the 'No. of Available Samples' text box
    And selects 'Sample Expiry Date'
    And clicks 'Save & Next' button
    Then the new sample should be created successfully
    And the user should be taken to the next step

  @Negative
  Scenario: Attempt to create sample without required fields
    Given the user is on the New Sampling page
    When clicks 'Save & Next' button
    Then error messages should be displayed for the required fields

  @Negative
  Scenario: Cancel sample creation
    Given the user is on the New Sampling page
    When the user selects required value 'Random' from the 'Brand Name' dropdown
    And the user enters required 'string' value 'Random' in the 'Sample Product Name' text box
    And the user enters required 'int' value 'Random' in the 'No. of Available Samples' text box
    And selects 'Sample Expiry Date'
    And clicks 'Cancel' button
    Then the form should be discarded
    And the user is on the 'Sampling' page