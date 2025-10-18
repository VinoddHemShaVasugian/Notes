@Regression @CampaignManager @Budget
Feature: Create New Budget Validation
  In order to manage campaign budgets effectively
  As a QA Tester
  I want to create and configure new budgets with allocations

  Background:
    Given the recognized user is on Campaign Manager dashboard page
    And clicks "Budget" menu
    And clicks "Create New" button

  @Smoke @Positive
  Scenario: Navigate through budget creation steps
    Then the user should see two configuration steps:
      | Step Name           |
      | Configuration       |
      | Budget Allocations  |
    And "Configuration" step should be active by default

  @Smoke @Positive
  Scenario Outline: Create new budget with valid configuration
    Given the user is on the "Configuration" step
    When the user selects "<Brand Name>" from brand dropdown
    And enters "<Budget Name>" in the budget name field
    And enters "<Description>" in the budget description field
    And selects "<Usage Type>" as budget usage type
    And enters "<Amount>" as allocation amount
    And selects "<Start Date>" as start date
    And selects "<End Date>" as end date
    And clicks "Save & Next" button
    Then the configuration should be saved
    And user should be navigated to "Budget Allocations" step

    Examples:
      | Brand Name  | Budget Name    | Description       | Usage Type                  | Amount | Start Date | End Date   |
      | Angel Soft  | Q4 Budget 2025 | Q4 Digital Budget | Digital Media Delivery Only | 1000   | 10/01/25   | 12/31/25   |

  @Negative
  Scenario: Validate required fields in configuration
    Given the user is on the "Configuration" step
    When the user clicks "Save & Next" button without filling required fields
    Then error messages should be displayed for:
      | Field Name          |
      | Brand Name          |
      | Budget Name         |
      | Budget Usage Type   |
      | Allocation Amount   |
      | Budget Duration     |

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
      | AddNewCategories      | 500              |
      | MS Lane July Campaign | 500              |
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
    And no budget should be created

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
    And can be edited later from the budget list