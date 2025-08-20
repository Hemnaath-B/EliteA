Feature: Search for Books

  Users should be able to search for books using various criteria such as title, author, genre, and more.

  Scenario: Access the search bar from the Books category page
    Given I am on the Books category page
    When I look for the search bar
    Then I should see the search bar visible and accessible

  Scenario: Search books using book titles
    Given I am on the Books category page
    When I enter a keyword related to a book title "Harry Potter" in the search bar and initiate the search
    Then I should see the search results displaying books with titles containing the keyword "Harry Potter"

  Scenario: Search books using author names
    Given I am on the Books category page
    When I enter a keyword related to an author's name "J.K. Rowling" in the search bar and initiate the search
    Then I should see the search results displaying books authored by "J.K. Rowling"

  Scenario: Search books using genres
    Given I am on the Books category page
    When I enter a keyword related to a genre "Fantasy" in the search bar and initiate the search
    Then I should see the search results displaying books categorized under the genre "Fantasy"

  Scenario: Search books with an empty keyword
    Given I am on the Books category page
    When I leave the search bar empty and initiate the search
    Then I should see a message indicating that no keyword was entered and prompting me to enter a keyword

  Scenario: Search books with invalid keywords
    Given I am on the Books category page
    When I enter a random string of characters "asdfghjkl" in the search bar and initiate the search
    Then I should see a message indicating that no books were found matching the entered keyword

  Scenario: Search books with special characters
    Given I am on the Books category page
    When I enter special characters "@#$%^&*" in the search bar and initiate the search
    Then I should see a message indicating that no books were found matching the entered keyword

  Scenario: Search books with a very long keyword
    Given I am on the Books category page
    When I enter a very long keyword (256 characters) in the search bar and initiate the search
    Then I should see relevant books if any match the long keyword, or a message indicating no books were found

  Scenario: Search books with mixed case letters
    Given I am on the Books category page
    When I enter a keyword with mixed case letters "HaRrY PoTtEr" in the search bar and initiate the search
    Then I should see books with titles containing the keyword "Harry Potter", demonstrating case insensitivity

  Scenario: Search books with leading and trailing spaces
    Given I am on the Books category page
    When I enter a keyword with leading and trailing spaces "  Harry Potter  " in the search bar and initiate the search
    Then I should see books with titles containing the keyword "Harry Potter", ignoring the leading and trailing spaces

  Scenario: Search books with non-English characters
    Given I am on the Books category page
    When I enter a keyword with non-English characters "El Niño" in the search bar and initiate the search
    Then I should see books with titles containing the keyword "El Niño"

  Scenario: Search books with multiple keywords
    Given I am on the Books category page
    When I enter multiple keywords "Harry Potter Fantasy" in the search bar and initiate the search
    Then I should see books that match any of the entered keywords, showing books related to "Harry Potter" or "Fantasy"

  Scenario: Search books with keywords containing punctuation
    Given I am on the Books category page
    When I enter keywords containing punctuation "Harry Potter, Fantasy" in the search bar and initiate the search
    Then I should see books that match the keywords "Harry Potter" and "Fantasy", handling punctuation correctly

  Scenario: Search books with keywords containing numbers
    Given I am on the Books category page
    When I enter keywords containing numbers "1984 George Orwell" in the search bar and initiate the search
    Then I should see books that match the keywords "1984" and "George Orwell"

Feature: Filter Books by Category

  Users should be able to filter books by selecting categories on the Books category page.

  Scenario: Access filter options on the Books category page
    Given I am on the Books category page
    When I look for filter options
    Then I should see filter options displayed on the page

  Scenario: Filter books by a single category
    Given I am on the Books category page