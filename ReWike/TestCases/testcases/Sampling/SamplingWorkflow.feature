@Regression @CampaignManager @Sampling @SamplingWorkflow
Feature: Sampling Workflow Validation
In order to validate the Sampling Workflow
  As a QA Tester
  I want to login to Campaign Manager and
  I want to create a new Sampling and manage product samples
  So, that I can track and organize sample inventory

  Background:
    Given the recognized user is on Campaign Manager dashboard page
    And the user clicks 'Sampling' menu
    And the user read the columns from 'Sampling' page
    And the user read the existing results from the list

  @Positive
  Scenario: Create new sample by selecting required Category with required fields and verify in the sampling page
    Given the user clicks 'Create New' button
    And the user is on the New Sampling page
    When the user selects required value 'Random' from the 'Brand Name' dropdown
    And the user enters required 'string' value 'Random' in the 'Sample Product Name' text box
    And the user enters required 'string' value 'Random' in the 'Description' text area
    And the user enters required 'int' value 'Random' in the 'No. of Available Samples' text box
    And the user selects 'Sample Expiry Date'
    And the user clicks 'Save & Next' button
    And the user switch to 'Categories' radio button
    And the user selects 'Random' checkbox
    And the user clicks 'Save & Next' button
    And the user enters required 'string' value 'Random' in the 'Contact Person Full Name : ' text box
    And the user enters required 'int' value 'Random' in the 'Phone Number : ' text box
    And the user enters required 'string' value 'Random' in the 'Company Email Address : ' text box
    And the user enters required 'string' value 'Random' in the 'Address : ' text box
    And the user enters required 'string' value 'Random' in the 'City : ' text box
    And the user selects required value 'Random' from the 'State / Province : ' dropdown
    And the user enters required 'int' value 'Random' in the 'Zip / Postal Code : ' text box
    And the user selects required value 'Random' from the 'Country : ' dropdown
    And the user clicks 'Save & Exit' button
    Then the confimration message 'Sample created successfully' should be displayed
    And the user selects required value 'Random' from the 'Select Brand(s)' dropdown
    And the list should only show samples for the selected brand 'Random'

  @Positive
  Scenario: Create new sample by selecting required products with required fields and verify in the sampling page
    Given the user clicks 'Create New' button
    And the user is on the New Sampling page
    When the user selects required value 'Random' from the 'Brand Name' dropdown
    And the user enters required 'string' value 'Random' in the 'Sample Product Name' text box
    And the user enters required 'string' value 'Random' in the 'Description' text box
    And the user enters required 'int' value 'Random' in the 'No. of Available Samples' text box
    And the user selects 'Sample Expiry Date'
    And the user clicks 'Save & Next' button
    And the user switch to 'Products' radio button
    And the user selects 'Random' checkbox
    And the user clicks 'Save & Next' button
    And the user enters required 'string' value 'Random' in the 'Contact Person Full Name : ' text box
    And the user enters required 'int' value 'Random' in the 'Phone Number : ' text box
    And the user enters required 'string' value 'Random' in the 'Company Email Address : ' text box
    And the user enters required 'string' value 'Random' in the 'Address : ' text box
    And the user enters required 'string' value 'Random' in the 'City : ' text box
    And the user selects required value 'Random' from the 'State / Province : ' dropdown
    And the user enters required 'int' value 'Random' in the 'Zip / Postal Code : ' text box
    And the user selects required value 'Random' from the 'Country : ' dropdown
    And the user clicks 'Save & Next' button
    Then the confimration message 'Sample created successfully' should be displayed
    And the user selects required value 'Random' from the 'Select Brand(s)' dropdown
    And the list should only show samples for the selected brand 'Random'

  @Positive
  Scenario: Modifying an existing sample by selecting required Category with required fields and verifying updated sample
    When the user do the search with 'Sample Name'
    And the user clicks 'More options' icon
    And the user clicks 'Edit' icon
    And the user enters required 'string' value 'Random' in the 'Sample Product Name' text box
    And the user enters required 'string' value 'Random' in the 'Description' text box
    And the user enters required 'int' value 'Random' in the 'No. of Available Samples' text box
    And the user selects 'Sample Expiry Date'
    And the user clicks 'Save & Next' button
    And the user switch to 'Categories' radio button
    And the user selects 'Random' checkbox
    And the user clicks 'Save & Next' button
    And the user enters required 'string' value 'Random' in the 'Contact Person Full Name : ' text box
    And the user enters required 'int' value 'Random' in the 'Phone Number : ' text box
    And the user enters required 'string' value 'Random' in the 'Company Email Address : ' text box
    And the user enters required 'string' value 'Random' in the 'Address : ' text box
    And the user enters required 'string' value 'Random' in the 'City : ' text box
    And the user selects required value 'Random' from the 'State / Province : ' dropdown
    And the user enters required 'int' value 'Random' in the 'Zip / Postal Code : ' text box
    And the user selects required value 'Random' from the 'Country : ' dropdown
    And the user clicks 'Save & Next' button
    Then the confimration message 'Sample updated successfully' should be displayed
    And the user enters required value 'Random' in the search box
    And the list should filter to show only samples matching the search criteria 'Random'

  @Positive
  Scenario: Clone an existing sample and verifying copied sample
    When the user do the search with 'Sample Name'
    And the user clicks 'More options' icon
    And the user clicks 'Clone' icon
    Then the confimration message 'Sample cloned successfully' should be displayed
    And the user selects required value 'Brand' from the 'Select Brand(s)' dropdown
    And the list should only show samples for the selected brand 'Brand' and ' - Copy'

  @Positive
  Scenario: Delete an existing sample and verifying deleted sample
    When the user selects required value 'Expired' from the 'All Status' dropdown
    And the list should only show samples with the selected status 'Expired'
    And the user do the search with 'Auto'
    And the user read the existing results from the list
    And the user clicks 'More options' icon
    And the user clicks 'Delete' icon
    And the user clicks 'Delete' button
    Then the confimration message 'Sample deleted successfully' should be displayed
    And the user selects required value 'Brand' from the 'Select Brand(s)' dropdown
    And the user verify an absence of sample for the selected brand 'Brand'

  @Negative
  Scenario: Attempt to create sample without required fields
    Given the user is on the New Sampling page
    When the user clicks 'Save & Next' button
    Then error messages should be displayed for the required fields

  @Negative
  Scenario: Cancel sample creation
    Given the user is on the New Sampling page
    When the user selects required value 'Random' from the 'Brand Name' dropdown
    And the user enters required 'string' value 'Random' in the 'Sample Product Name' text box
    And the user enters required 'int' value 'Random' in the 'No. of Available Samples' text box
    And the user selects 'Sample Expiry Date'
    And the user clicks 'Cancel' button
    Then the user is on the 'Sampling' page
