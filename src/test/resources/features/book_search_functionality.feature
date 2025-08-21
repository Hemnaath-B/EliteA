Feature: Book Search Functionality

  This feature allows users to search for books using various criteria such as title, author, ISBN, and more.

  Scenario: Search for Books by Title
    Given I am on the Books category page
    When I enter "Harry Potter" in the search bar
    And I press the search button
    Then I should see a list of books with titles containing "Harry Potter"

  Scenario: Search for Books by Author
    Given I am on the Books category page
    When I enter "J.K. Rowling" in the search bar
    And I press the search button
    Then I should see a list of books authored by "J.K. Rowling"

  Scenario: Search for Books by ISBN
    Given I am on the Books category page
    When I enter "978-3-16-148410-0" in the search bar
    And I press the search button
    Then I should see the book with the ISBN "978-3-16-148410-0"

  Scenario: Partial Match Search
    Given I am on the Books category page
    When I enter "Harry" in the search bar
    And I press the search button
    Then I should see a list of books with titles containing "Harry"

  Scenario: Case-Insensitive Search
    Given I am on the Books category page
    When I enter "harry potter" in the search bar
    And I press the search button
    Then I should see a list of books with titles containing "Harry Potter"

  Scenario: Search with Special Characters
    Given I am on the Books category page
    When I enter "Harry Potter & the Sorcerer's Stone" in the search bar
    And I press the search button
    Then I should see the book "Harry Potter & the Sorcerer's Stone"

  Scenario: Search with Spaces
    Given I am on the Books category page
    When I enter "Harry Potter and the Sorcerer's Stone" in the search bar
    And I press the search button
    Then I should see the book "Harry Potter and the Sorcerer's Stone"

  Scenario: No Matching Results
    Given I am on the Books category page
    When I enter "Nonexistent Book" in the search bar
    And I press the search button
    Then I should see a message "No results found"

  Scenario: Invalid ISBN Format
    Given I am on the Books category page
    When I enter "123-abc-456" in the search bar
    And I press the search button
    Then I should see a message "No results found"

  Scenario: Empty Search Input
    Given I am on the Books category page
    When I leave the search bar empty
    And I press the search button
    Then I should see a message "Please enter a search term"

  Scenario: Search with Very Long String
    Given I am on the Books category page
    When I enter a string with 1000 characters in the search bar
    And I press the search button
    Then I should see a message "No results found" or a list of books matching the partial string (if any)

  Scenario: Search with Single Character
    Given I am on the Books category page
    When I enter "A" in the search bar
    And I press the search button
    Then I should see a list of books with titles containing "A"

  Scenario: Search with Special Characters Only
    Given I am on the Books category page
    When I enter "!@#$%^&*" in the search bar
    And I press the search button
    Then I should see a message "No results found"

  Scenario: Search Performance
    Given I am on the Books category page
    When I enter "Harry Potter" in the search bar
    And I press the search button
    Then I should see the search results within 2 seconds

  Scenario: Search with Leading and Trailing Spaces
    Given I am on the Books category page
    When I enter "  Harry Potter  " in the search bar
    And I press the search button
    Then I should see a list of books with titles containing "Harry Potter"

  Scenario: Search with Mixed Case and Special Characters
    Given I am on the Books category page
    When I enter "HaRrY PoTtEr & ThE SoRcErEr'S StOnE" in the search bar
    And I press the search button
    Then I should see the book "Harry Potter & the Sorcerer's Stone"