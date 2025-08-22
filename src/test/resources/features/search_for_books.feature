Feature: Search for Books

Scenario: Verify visibility of the search bar on the Books category page
Given I am on the Books category page
When I look at the page
Then I should see the search bar

Scenario: Verify search functionality with a single keyword
Given I am on the Books category page
When I enter the keyword "fiction" into the search bar and initiate the search
Then I should see books related to "fiction" in the search results

Scenario: Verify search functionality with multiple keywords
Given I am on the Books category page
When I enter the keywords "science fiction" into the search bar and initiate the search
Then I should see books related to "science fiction" in the search results

Scenario: Verify search functionality with an empty search bar
Given I am on the Books category page
When I leave the search bar empty and initiate the search
Then I should see no books in the search results and an appropriate message

Scenario: Verify search functionality with invalid characters
Given I am on the Books category page
When I enter invalid characters such as "!@#$%^&*" into the search bar and initiate the search
Then I should see no books in the search results and an appropriate message

Scenario: Verify search functionality with a very long keyword
Given I am on the Books category page
When I enter a very long keyword into the search bar and initiate the search
Then I should see relevant books matching the keyword or an appropriate message

Scenario: Verify search functionality with a keyword containing spaces
Given I am on the Books category page
When I enter the keyword "Harry Potter" into the search bar and initiate the search
Then I should see books related to "Harry Potter" in the search results

Scenario: Verify search functionality with a keyword containing special characters
Given I am on the Books category page
When I enter the keyword "C++ Programming" into the search bar and initiate the search
Then I should see books related to "C++ Programming" in the search results

Scenario: Verify search functionality with a keyword in different languages
Given I am on the Books category page
When I enter the keyword "El principito" into the search bar and initiate the search
Then I should see books related to "El principito" in the search results

Scenario: Verify search functionality with a keyword in mixed case
Given I am on the Books category page
When I enter the keyword "HaRrY PoTtEr" into the search bar and initiate the search
Then I should see books related to "Harry Potter" in the search results