Feature: Search and Filter Books

  This feature allows users to search for books by various criteria and filter books by category on the Books category page.

  Scenario: Search for books by title
    Given I am on the Books category page
    When I enter "To Kill a Mockingbird" in the search bar
    Then I should see books with the title "To Kill a Mockingbird" including title, author, ISBN, genre, and availability status

  Scenario: Search for books by author
    Given I am on the Books category page
    When I enter "Harper Lee" in the search bar
    Then I should see books authored by "Harper Lee" including title, author, ISBN, genre, and availability status

  Scenario: Search for books by ISBN
    Given I am on the Books category page
    When I enter "9780061120084" in the search bar
    Then I should see books with the ISBN "9780061120084" including title, author, ISBN, genre, and availability status

  Scenario: Search for books by genre
    Given I am on the Books category page
    When I enter "Fiction" in the search bar
    Then I should see books in the "Fiction" genre including title, author, ISBN, genre, and availability status

  Scenario: Handle empty search input
    Given I am on the Books category page
    When I leave the search bar empty and click search
    Then I should see a message indicating no results found

  Scenario: Handle special characters in search input
    Given I am on the Books category page
    When I enter "@#$%^&*" in the search bar
    Then I should see a message indicating no results found

  Scenario: Handle invalid ISBN format
    Given I am on the Books category page
    When I enter "12345" in the search bar
    Then I should see a message indicating no results found

  Scenario: Case-insensitive search functionality
    Given I am on the Books category page
    When I enter "to kill a mockingbird" in the search bar
    Then I should see books with the title "To Kill a Mockingbird" including title, author, ISBN, genre, and availability status

  Scenario: Partial match search functionality
    Given I am on the Books category page
    When I enter "Mockingbird" in the search bar
    Then I should see books with the title containing "Mockingbird" including title, author, ISBN, genre, and availability status

  Scenario: Search with a very long string
    Given I am on the Books category page
    When I enter a string with 256 characters in the search bar
    Then I should see a message indicating no results found

  Scenario: Search with a single character
    Given I am on the Books category page
    When I enter "a" in the search bar
    Then I should see books with titles, authors, ISBNs, or genres containing the character "a" including title, author, ISBN, genre, and availability status

  Scenario: Search with numeric characters in title or author
    Given I am on the Books category page
    When I enter "1984" in the search bar
    Then I should see books with the title "1984" or authored by "George Orwell" including title, author, ISBN, genre, and availability status

  Scenario: Search with mixed alphanumeric characters
    Given I am on the Books category page
    When I enter "Harry Potter 7" in the search bar
    Then I should see books with titles or authors containing "Harry Potter 7" including title, author, ISBN, genre, and availability status

  Scenario: Search with leading and trailing spaces
    Given I am on the Books category page
    When I enter "  To Kill a Mockingbird  " in the search bar
    Then I should see books with the title "To Kill a Mockingbird" including title, author, ISBN, genre, and availability status

  Scenario: Search with non-English characters
    Given I am on the Books category page
    When I enter "Cien años de soledad" in the search bar
    Then I should see books with the title "Cien años de soledad" including title, author, ISBN, genre, and availability status

  Scenario: Filter books by selecting a category
    Given I am on the Books category page
    When I select a category from the dropdown menu
    Then the list of books updates to show only books from the selected category

  Scenario: Clear the category filter
    Given I have selected a category filter on the Books category page
    When I clear the selected category filter
    Then the list of books updates to show all available books

  Scenario: List all available categories in the dropdown menu
    Given I am on the Books category page
    When I open the dropdown menu
    Then the dropdown menu displays all available categories