@Regression @CampaignManager @Budget
Feature: Budget Management Validations
  In order to validate the Budget Management page
  As a QA Tester
  I want to login to Campaign Manager and
  I want to create a new budget and manage budgets
  So, that I can track and organize campaign budgets effectively

  Background:
    Given the recognized user is on Campaign Manager dashboard page
    And the user clicks "Budget" menu

  @Smoke @Positive
  Scenario: View list of budgets
    Then the user is on the 'Budgets' page
    And the user should see a list of budgets with columns:
      | Budget Name | Brand | Usage | Start Date | End Date | Budget | Status |
    And each budget should display its details correctly
    And expired budgets should be marked with "Expired" status
    And active budgets should show budget utilization bar

  @Positive
  Scenario Outline: Filter budgets by brand
    When the user selects required value '<Brand Name>' from the "Select Brand(s)" dropdown
    Then the list should only show budgets for the selected brand '<Brand Name>'

    Examples:
      | Brand Name |
      | Angel Soft |
      | Red Bull   |
      | Lysol      |
      | Advil      |
      | Huggies    |

  @Positive
  Scenario Outline: Search for budgets
    When the user enters required value '<budgets>' in the search box
    Then the list should filter to show only budgets matching the search criteria '<budgets>'

    Examples:
      | budgets           |
      | TestBudget        |
      | Tide Brand Budget |
      | MultiBudget       |

  @Positive
  Scenario Outline: Filter budgets by usage type
    When the user selects required value '<UsageType>' from the "Select Budget Usage" dropdown
    Then the list should only show budgets with the selected usage type '<UsageType>'

    Examples:
      | UsageType              |
      | Digital Media Only     |
      | Physical Sampling Only |

  @Positive
  Scenario Outline: Filter budgets by status
    When the user selects required value '<status>' from the 'All Status' dropdown
    Then the list should only show budgets with the selected status '<status>'

    Examples:
      | status   |
      | Active   |
      | Expired  |
      | Depleted |

  @Positive
  Scenario: View budget utilization
    Given the user is viewing the budget list
    When looking at a budget entry
    Then the budget utilization bar should show:
      | Total Budget Amount |
      | Used Amount         |
      | Remaining Amount    |
    And the utilization bar should be color coded based on usage percentage

  @Positive
  Scenario: Verify info icon 'i' on View budget utilization column
    Given the user is viewing the budget list
    When the user hovers over the info icon 'i' in the 'Budget Utilization' column
    Then the tooltip should appear with the campaigns details, which are shared with this budget
