Feature: Bookstore Functionalities

  This feature covers various functionalities of the bookstore website including searching for books, filtering by category, adding books to cart and wishlist, checkout process, writing reviews, viewing book details, and comparing books.

  Scenario: Search for Books
    Given the search bar is visible on the homepage
    When I enter a book title "Harry Potter" in the search bar
    Then I should see a list of books matching the title "Harry Potter"

  Scenario: Filter Books by Category
    Given the list of categories is displayed on the book list page
    When I select the category "Fantasy"
    Then I should see books belonging to the "Fantasy" category

  Scenario: Add Books to Cart
    Given I am on the book details page
    When I click "Add to Cart"
    Then the book should be added to my cart and the number of items in the cart should update

  Scenario: Add Books to Wishlist
    Given I am logged in and on the book details page
    When I click "Add to Wishlist"
    Then the book should be added to my wishlist and a confirmation message should be displayed

  Scenario: Checkout Process
    Given I have items in my cart
    When I enter valid shipping information and payment method
    Then I should be able to confirm the purchase and receive a confirmation email

  Scenario: Write a Review for Books
    Given I am logged in and on the book details page
    When I enter a rating and comment and submit the review
    Then the review should be stored and visible under the book's details page

  Scenario: View Book Details
    Given I am on the book list page
    When I click on a book title
    Then I should see the book details including title, author, publication date, ISBN, genre, and description

  Scenario: Compare Books
    Given I am on the search results page
    When I select two books for comparison
    Then I should see the comparison view with the title, author, price, rating, and description for both books