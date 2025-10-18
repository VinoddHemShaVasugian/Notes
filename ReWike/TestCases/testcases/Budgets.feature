@Regression @CampaignManager @Budget
Feature: Budget Management Validation
  In order to validate the Budget Management page
  As a QA Tester
  I want to login to Campaign Manager and
  I want to create a new budget and manage budgets
  So, that I can track and organize campaign budgets effectively

  Background:
    Given the recognized user is on Campaign Manager dashboard page
    And clicks "Budget" menu

  @Smoke @Positive
  Scenario: View list of budgets
    Then the user is on the 'Budgets' page
    And the user should see a list of budgets with columns:
      | Budget Name | Brand | Usage | Start Date | End Date | Budget | Status |
    And each budget should display its details correctly
    And expired budgets should be marked with "Expired" status
    And active budgets should show budget utilization bar

  @Positive
  Scenario: Filter budgets by brand
    When the user selects required value 'Huggies' from the "Select Brand(s)" dropdown
    Then the list should only show budgets for the selected brand 'Huggies'
    And all displayed budgets should belong to 'Huggies' brand

  @Positive
  Scenario: Search for budgets
    When the user enters required value 'AssignedBudget' in the search box
    Then the list should filter to show only budgets matching the search criteria 'AssignedBudget'

  @Positive
  Scenario: Filter budgets by usage type
    When the user selects required value 'Digital Media Only' from the "Select Budget Usage" dropdown
    Then the list should only show budgets with the selected usage type 'Digital Media Only'

  @Positive
  Scenario: Filter budgets by status
    When the user selects required value 'Expired' from the "Select Status" dropdown
    Then the list should only show budgets with 'Expired' status

  @Positive
  Scenario: View budget utilization
    Given the user is viewing the budget list
    When looking at a budget entry
    Then the budget utilization bar should show:
      | Total Budget Amount |
      | Used Amount         |
      | Remaining Amount    |
    And the utilization bar should be color coded based on usage percentage
