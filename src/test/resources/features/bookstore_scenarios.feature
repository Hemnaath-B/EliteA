Feature: Bookstore Scenarios

#### Scenario: Search for Books
  Given I am on the Books category page
  When I enter the keyword "Harry Potter" into the search bar and initiate a search
  Then I should see books related to "Harry Potter" displayed

#### Scenario: Filter Books by Category
  Given I am on the Books category page
  When I select the category "Science Fiction" to filter the book listings
  Then I should see only books in the "Science Fiction" category displayed

#### Scenario: Add Book to Cart
  Given I am viewing a book listing
  When I click the "Add to Cart" button for the book "Dune"
  Then the book "Dune" should be added to my shopping cart and the cart count should be updated

#### Scenario: Add Book to Wishlist
  Given I am viewing a book listing
  When I click the "Add to Wishlist" button for the book "1984"
  Then the book "1984" should be added to my wishlist and the wishlist count should be updated

#### Scenario: Checkout Process
  Given I have books in my shopping cart
  When I proceed to checkout from the shopping cart page
  Then I should be able to enter shipping and payment information to complete the purchase and receive a confirmation

#### Scenario: Write a Book Review
  Given I am on the book's detail page for "The Hobbit"
  When I access the review section and write a review
  Then my review should be submitted and displayed under "The Hobbit"

#### Scenario: View Book Details
  Given I am viewing a book listing
  When I click on the book listing for "To Kill a Mockingbird"
  Then I should see detailed information about "To Kill a Mockingbird" displayed

#### Scenario: Compare Books
  Given I am viewing multiple book listings
  When I select "The Catcher in the Rye" and "The Great Gatsby" to compare
  Then I should see a comparison of "The Catcher in the Rye" and "The Great Gatsby" displayed side by side

#### Scenario: Sort Books
  Given I am on the Books category page
  When I select the sort option to sort books by price in ascending order
  Then I should see books displayed sorted by price from lowest to highest

#### Scenario: Search with Invalid Input
  Given I am on the Books category page
  When I enter the keyword "!!!@@@###" into the search bar and initiate a search
  Then I should see no books displayed and an appropriate message shown

#### Scenario: Filter with Invalid Category
  Given I am on the Books category page
  When I select the category "Unknown Category" to filter the book listings
  Then I should see no books displayed and an appropriate message shown

#### Scenario: Add Book to Cart with Invalid Book ID
  Given I am viewing a book listing
  When I attempt to add a book with ID "999999" to the cart
  Then I should see an error message indicating the book cannot be added

#### Scenario: Add Book to Wishlist with Invalid Book ID
  Given I am viewing a book listing
  When I attempt to add a book with ID "999999" to the wishlist
  Then I should see an error message indicating the book cannot be added

#### Scenario: Checkout Process with Empty Cart
  Given I have an empty shopping cart
  When I proceed to checkout from the shopping cart page
  Then I should see an error message indicating the cart is empty

#### Scenario: Write Review Without Purchasing the Book
  Given I am on the book's detail page for a book I have not purchased
  When I attempt to write a review for the book
  Then I should see an error message indicating I must purchase the book to write a review

#### Scenario: View Book Details with Invalid Book ID
  Given I am viewing a book listing
  When I attempt to view details for a book with ID "999999"
  Then I should see an error message indicating the book details cannot be found

#### Scenario: Compare Books with Invalid Book IDs
  Given I am viewing multiple book listings
  When I attempt to compare books with IDs "999999" and "888888"
  Then I should see an error message indicating the books cannot be compared

#### Scenario: Sort Books with Invalid Criteria
  Given I am on the Books category page
  When I select the sort option to sort books by an invalid criteria "Unknown Criteria"
  Then I should see an error message indicating the sorting criteria is invalid

#### Scenario: Search with Very Long Keyword
  Given I am on the Books category page
  When I enter a keyword with 256 characters into the search bar and initiate a search
  Then I should see books related to the keyword displayed, or an appropriate message shown if no books match

#### Scenario: Filter with Very Large Number of Categories
  Given I am