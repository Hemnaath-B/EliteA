Feature: Filtering Books by Category

  Users should be able to filter books by categories to narrow down their search results effectively.

  Scenario: Filter option accessibility on books category page
    Given I am on the books category page
    When I look at the page
    Then I should see the filter option visible and accessible

  Scenario: Filter books by single category
    Given I am on the books category page
    When I select one category from the filter options
    Then I should see filtered results displaying only books that match the selected category

  Scenario: Filter books by multiple categories
    Given I am on the books category page
    When I select multiple categories from the filter options
    Then I should see filtered results displaying only books that match any of the selected categories

  Scenario: Dynamic update of filtered results
    Given I am on the books category page
    When I select and deselect categories from the filter options
    Then I should see filtered results update immediately to reflect the selected categories

  Scenario: Correct display of filtered results
    Given I am on the books category page
    When I select one or more categories from the filter options
    Then I should see filtered results displaying books with accurate titles, authors, and other relevant details matching the selected categories

  Scenario: No categories selected
    Given I am on the books category page
    When I do not select any category from the filter options
    Then I should see all books without any filtering

  Scenario: Invalid category selection
    Given I am on the books category page
    When I attempt to select a category that does not exist