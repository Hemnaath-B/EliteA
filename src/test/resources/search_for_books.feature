Feature: Search for Books

  This feature allows users to search for books by various criteria such as title, author, ISBN, and keywords. It ensures that the search functionality is robust and handles different types of input gracefully.

  Scenario: Search by book title
    Given I am on the Books category page
    When I enter "To Kill a Mockingbird" in the search bar
    Then I should see books with the title "To Kill a Mockingbird" including title, author, publication date, and availability status

  Scenario: Search by author name
    Given I am on the Books category page
    When I enter "Harper Lee" in the search bar
    Then I should see books authored by "Harper Lee" including title, author, publication date, and availability status

  Scenario: Search by ISBN
    Given I am on the Books category page
    When I enter "9780060935467" in the search bar
    Then I should see the book with ISBN "9780060935467" including title, author, publication date, and availability status

  Scenario: Search by keyword
    Given I am on the Books category page
    When I enter "Mockingbird" in the search bar
    Then I should see books containing the keyword "Mockingbird" in the title or description including title, author, publication date, and availability status

  Scenario: Partial match search
    Given I am on the Books category page
    When I enter "Mock" in the search bar
    Then I should see books with titles or descriptions containing "Mock" including title, author, publication date, and availability status

  Scenario: Case-insensitive search
    Given I am on the Books category page
    When I enter "to kill a mockingbird" in the search bar
    Then I should see books with the title "To Kill a Mockingbird" including title, author, publication date, and availability status

  Scenario: No matching results
    Given I am on the Books category page
    When I enter "Nonexistent Book Title" in the search bar
    Then I should see a message indicating no results were found

  Scenario: Search with special characters
    Given I am on the Books category page
    When I enter "To Kill a Mockingbird!@#" in the search bar
    Then I should see an error message indicating invalid characters in the search input

  Scenario: Search with empty input
    Given I am on the Books category page
    When I perform a search with an empty input field
    Then I should see an error message indicating that the search field cannot be empty

  Scenario: Search with a very long string
    Given I am on the Books category page
    When I enter a string with 256 characters in the search bar
    Then I should see a message indicating the search input is too long or handle the input gracefully by truncating and performing the search

  Scenario: Search with a single character
    Given I am on the Books category page
    When I enter "a" in the search bar
    Then I should see books with titles or descriptions containing the character "a" including title, author, publication date, and availability status

  Scenario: Search performance
    Given I am on the Books category page
    When I enter "Harry Potter" in the search bar
    Then I should see search results within 2 seconds including title, author, publication date, and availability status

  Scenario: Search with numeric input
    Given I am on the Books category page
    When I enter "12345" in the search bar
    Then I should see books with titles, authors, or descriptions containing "12345" including title, author, publication date, and availability status

  Scenario: Search with mixed alphanumeric input
    Given I am on the Books category page
    When I enter "Harry123" in the search bar
    Then I should see books with titles, authors, or descriptions containing "Harry123" including title, author, publication date, and availability status

  Scenario: Search with leading and trailing spaces
    Given I am on the Books category page
    When I enter "  To Kill a Mockingbird  " in the search bar
    Then I should see books with the title "To Kill a Mockingbird" including title, author, publication date, and availability status, ignoring leading and trailing spaces