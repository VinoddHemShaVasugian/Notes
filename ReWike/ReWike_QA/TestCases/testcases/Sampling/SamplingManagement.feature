@Regression @CampaignManager @Sampling
Feature: Sampling Management Validation
In order to validate the Sampling Management page
  As a QA Tester
  I want to login to Campaign Manager and
  navigates to sampling page
  So, that I can track and organize sample inventory

  Background:
    Given the recognized user is on Campaign Manager dashboard page
    And the user clicks 'Sampling' menu

  @Smoke @Positive
  Scenario: View list of samples
    Then the user is on the 'Sampling' page
    And the user should see a list of samples with columns:
      | Sample Name | Brand | Inventory | Delivered | Expiry Date | Status | Actions |
    And each sample should display its details correctly
    And expired samples should be marked with 'Expired' status
    And active samples should be marked with 'Active' status
    And depleted samples should be marked with 'Depleted' status

  @Positive
  Scenario Outline: Filter samples by brand
    When the user selects required value '<Brand Name>' from the 'Select Brand(s)' dropdown
    Then the list should only show samples for the selected brand '<Brand Name>'

    Examples:
      | Brand Name |
      | Angel Soft |
      | Red Bull   |
      | Lysol      |
      | Advil      |
      | Huggies    |

  @Positive
  Scenario Outline: Search for samples
    When the user enters required value '<samples>' in the search box
    Then the list should filter to show only samples matching the search criteria '<samples>'

    Examples:
      | samples       |
      | Angel Soft    |
      | AdvilSample   |
      | Modelo Sample |

  @Positive
  Scenario Outline: Filter samples by status
    When the user selects required value '<status>' from the 'All Status' dropdown
    Then the list should only show samples with the selected status '<status>'

    Examples:
      | status   |
      | Active   |
      | Expired  |
      | Depleted |
