@Regression @CampaignManager @Budget
Feature: Create New Budget Validation
  In order to manage campaign budgets effectively
  As a QA Tester
  I want to create and configure new budgets with allocations

  Background:
    Given the recognized user is on Campaign Manager dashboard page
    And the user clicks 'Budget' menu
    And the user read the columns from 'Budget' page
    And the user read the existing results from the list

  @Smoke @Positive
  Scenario: Navigate through budget creation steps
    When the user clicks 'Create New' button
    Then the user should see two configuration steps:
      | Step Name          |
      | Configuration      |
      | Budget Allocations |
    And the "Configuration" step should be active by default

  @Smoke @Positive
  Scenario: Create new budget with valid configuration for Digital Media Delivery Only
    Given the user clicks 'Create New' button
    When the user selects required value 'Random' from the 'Brand Name' dropdown
    And the user enters required 'string' value 'Random' in the 'Budget Name' text box
    And the user enters required 'string' value 'Random' in the 'Budget Description' text area
    And the user selects 'Digital Media Delivery Only' radio button
    And the user enters required 'int' value 'Random' in the 'Allocation Amount' text box
    And the user selects "CurrentDate" as date range for budget 'Start date'
    And the user selects "Current+90" as date range for budget 'End date'
    And the user clicks "Save & Next" button
    Then user should be navigated to "Budget Allocations" step
    And the selected 'Random' 'Brand Name' should be displayed in the header
    And the entered 'Random' 'Allocation Amount' should be displayed in the header
    And the user read the columns from 'Budget Allocations' page
    And the user read the existing results from the list
    And verify the 'Brand Name' value in all the results based on column name 'Brand'
    And the user select the checkbox for 'Campaign Name'
    And the user enters required 'int' value 'Allocation Amount-1' in the 'Allocation Budget' text box
    And the user clicks "Save & Exit" button
    And the confimration message 'Budget created successfully' should be displayed
    And the user enters required value 'Budget Name' in the search box
    And the list should filter to show only budgets matching the search criteria 'Budget Name'

  @Smoke @Positive
  Scenario: Create new budget with valid configuration for Physical Sample Delivery
    Given the user clicks 'Create New' button
    When the user selects required value 'Random' from the 'Brand Name' dropdown
    And the user enters required 'string' value 'Random' in the 'Budget Name' text box
    And the user enters required 'string' value 'Random' in the 'Budget Description' text area
    And the user selects 'Physical Sample Delivery' radio button
    And the user enters required 'int' value 'Random' in the 'Allocation Amount' text box
    And the user selects "CurrentDate" as date range for budget 'Start date'
    And the user selects "Current+90" as date range for budget 'End date'
    And the user clicks "Save & Next" button
    Then user should be navigated to "Budget Allocations" step
    And the selected 'Random' 'Brand Name' should be displayed in the header
    And the entered 'Random' 'Allocation Amount' should be displayed in the header
    And the user read the columns from 'Budget Allocations' page
    And the user read the existing results from the list
    And verify the 'Brand Name' value in all the results based on column name 'Brand'
    And the user select the checkbox for 'Campaign Name'
    And the user enters required 'int' value 'Allocation Amount-1' in the 'Allocation Budget' text box
    And the user clicks "Save & Exit" button
    And the confimration message 'Budget created successfully' should be displayed
    And the user enters required value 'Budget Name' in the search box
    And the list should filter to show only budgets matching the search criteria 'Budget Name'

  @Smoke @Positive
  Scenario: Modifying an existing budget and verifying updated budget
    When the user do the search with 'Budget Name'
    And the user clicks 'More options' icon
    And the user clicks 'Edit' icon
    And the user selects required value 'Random' from the 'Brand Name' dropdown
    And the user enters required 'string' value 'Random' in the 'Budget Name' text box
    And the user enters required 'string' value 'Random' in the 'Budget Description' text area
    And the user selects 'Physical Sample Delivery' radio button
    And the user enters required 'int' value 'Random' in the 'Allocation Amount' text box
    And the user selects "CurrentDate" as date range for budget 'Start date'
    And the user selects "Current+90" as date range for budget 'End date'
    And the user clicks "Save & Next" button
    Then user should be navigated to "Budget Allocations" step
    And the selected 'Random' 'Brand Name' should be displayed in the header
    And the entered 'Random' 'Allocation Amount' should be displayed in the header
    And the user read the columns from 'Budget Allocations' page
    And the user read the existing results from the list
    And verify the 'Brand Name' value in all the results based on column name 'Brand'
    And the user select the checkbox for 'Campaign Name'
    And the user enters required 'int' value 'Allocation Amount-1' in the 'Allocation Budget' text box
    And the user clicks "Save & Exit" button
    And the confimration message 'Budget updated successfully' should be displayed
    And the user enters required value 'Budget Name' in the search box
    And the list should filter to show only budgets matching the search criteria 'Budget Name'

  @Positive
  Scenario: Clone an existing budget and verifying copied budget
    When the user do the search with 'Budget Name'
    And the user clicks 'More options' icon
    And the user clicks 'Clone' icon
    Then the confimration message 'Budget cloned successfully' should be displayed
    And the user enters required value 'Budget Name' in the search box
    And the list should filter to show only budgets matching the search criteria 'Budget Name'
    And the list should filter to show only budgets matching the search criteria 'Budget Name' and ' - Copy'

  @Positive
  Scenario: Delete an existing budget and verifying deleted budget
    When the user selects required value 'Expired' from the 'All Status' dropdown
    And the list should only show budgets with the selected status 'Expired'
    And the user do the search with 'Auto'
    And the user read the existing results from the list
    And the user clicks 'More options' icon
    And the user clicks 'Delete' icon
    And the user clicks 'Delete' button
    Then the confirmation message 'Budget deleted successfully' should be displayed
    And the user enters required value 'Budget Name' in the search box
    And the user verify an absence of budget 'Budget Name'

  @Negative
  Scenario: Validate required fields in configuration
    Given the user clicks 'Create New' button
    When the user clicks "Save & Next" button without filling required fields
    Then error messages should be displayed for:
      | Field Name        |
      | Brand Name        |
      | Budget Name       |
      | Budget Usage Type |
      | Allocation Amount |
      | Budget Duration   |

  @Positive
  Scenario: View available campaigns for budget allocation
    Given the user is on the "Budget Allocations" step
    Then the user should see available campaigns with columns:
      | Campaign Name | Goal | Brand | Start Date | End Date | Current Allocation(s) | Available Budget | Allocate Budget | Status |
    And total available budget amount should be displayed at the top

  @Smoke @Positive
  Scenario: Allocate budget to campaigns
    Given the user is on the "Budget Allocations" step
    When the user selects campaigns:
      | Campaign Name         | Allocation Amount |
      | AddNewCategories      |               500 |
      | MS Lane July Campaign |               500 |
    And clicks "Save & Exit" button
    Then the budget should be allocated successfully
    And user should be redirected to budget list page

  @Negative
  Scenario: Validate budget allocation limits
    Given the user is on the "Budget Allocations" step
    When the user tries to allocate more than available budget
    Then an error message should indicate exceeding budget limit
    And the allocation should not be saved

  @Positive
  Scenario: Cancel budget creation
    Given the user is on either configuration or allocation step
    When clicks "Cancel" button
    Then a confirmation dialog should appear
    When user confirms cancellation
    Then user should be redirected to budget list page

  @Positive
  Scenario: Search campaigns in allocation step
    Given the user is on the "Budget Allocations" step
    When enters text in the campaign search box
    Then the campaign list should filter based on search criteria

  @Smoke @Positive
  Scenario: Save draft budget configuration
    Given the user has partially filled the configuration step
    When clicks "Save & Next" button
    Then the budget should be saved with "Draft" status
