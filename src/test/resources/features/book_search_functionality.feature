Feature: Book Search Functionality

  Users should be able to search for books using various keywords and filters to find their desired books easily.

  Scenario: Search bar accessibility on books category page
    Given I am on the books category page
    When I look at the page
    Then I should see the search bar visible and accessible

  Scenario: Search books by title keyword
    Given I am on the books category page
    When I enter "Harry Potter" in the search bar
    Then I should see search results displaying books with titles containing "Harry Potter"

  Scenario: Search books by author keyword
    Given I am on the books category page
    When I enter "J.K. Rowling" in the search bar
    Then I should see search results displaying books written by "J.K. Rowling"

  Scenario: Search books by genre keyword
    Given I am on the books category page
    When I enter "Fantasy" in the search bar
    Then I should see search results displaying books belonging to the "Fantasy" genre

  Scenario: Search with empty input
    Given I am on the books category page
    When I leave the search bar empty and initiate the search
    Then I should see a message indicating no search keyword was entered or no search results

  Scenario: Search with invalid keywords
    Given I am on the books category page
    When I enter "asdfghjkl" in the search bar
    Then I should see no books or a message indicating no relevant books found

  Scenario: Search with special characters
    Given I am on the books category page
    When I enter "@#$%^&*" in the search bar
    Then I should see no books or a message indicating no relevant books found

  Scenario: Search with very long keyword
    Given I am on the books category page
    When I enter a very long keyword in the search bar
    Then I should see relevant books if any match the long keyword or a message indicating no relevant books found

  Scenario: Search with single character keyword
    Given I am on the books category page
    When I enter "a" in the search bar
    Then I should see books with titles, authors, or genres containing "a"

  Scenario: Search with mixed case keywords
    Given I am on the books category page
    When I enter "HaRrY PoTtEr" in the search bar
    Then I should see books with titles, authors, or genres matching the keyword regardless of case sensitivity

  Scenario: Search with leading and trailing spaces
    Given I am on the books category page
    When I enter "  Harry Potter  " in the search bar
    Then I should see books with titles, authors, or genres matching the keyword after trimming the spaces

  Scenario: Search with multiple keywords
    Given I am on the books category page
    When I enter "Harry Potter Fantasy" in the search bar
    Then I should see books that match any of the keywords "Harry", "Potter", or "Fantasy"

  Scenario: Search with keywords containing numbers
    Given I am on the books category page
    When I enter "1984 George Orwell" in the search bar
    Then I should see books with titles, authors, or genres containing "1984" or "George Orwell"