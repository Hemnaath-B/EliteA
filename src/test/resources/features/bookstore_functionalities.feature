Feature: Bookstore functionalities

  This feature covers various functionalities of an online bookstore, including searching, filtering, adding to cart, and more.

  Scenario: Search for Books
    Given the user is on the Books category page
    When the user enters "Harry Potter" in the search bar
    Then the system displays books with titles containing "Harry Potter", including title, author, ISBN, and availability status

  Scenario: Filter Books by Category
    Given the user is on the Books category page
    When the user selects the "Fantasy" category from the filter options
    Then the system displays books that match the "Fantasy" category

  Scenario: Add Book to Cart
    Given the user is logged in and on the Books category page
    When the user clicks the "Add to Cart" button for an in-stock book
    Then the book is added to the shopping cart, the total price updates, and a confirmation message is displayed

  Scenario: Add Book to Wishlist
    Given the user is logged in and on the book details page
    When the user clicks the "Add to Wishlist" button
    Then the book is added to the user's wishlist, and a confirmation message is displayed

  Scenario: Checkout Process
    Given the user is logged in and has items in the shopping cart
    When the user enters valid shipping and payment information and reviews the order
    Then the system displays an order confirmation page with correct order details

  Scenario: Write a Review for a Book
    Given the user is logged in and on the book details page
    When the user rates the book 4 stars, writes a comment "Great book!", and submits the review
    Then the review is stored in the system, and the user receives a confirmation message

  Scenario: View Book Details
    Given the user is on the Books category page
    When the user clicks on a book title
    Then the system navigates to the book details page displaying the book title, author, publication date, ISBN, genre, and a brief description

  Scenario: Sort Books by Price
    Given the user is on the Books category page
    When the user selects "Sort by price: Low to High"
    Then the system displays books in ascending order by price

  Scenario: Compare Books
    Given the user is on the Books category page
    When the user selects two books to compare
    Then the system displays the comparison view with the title, author, publication date, genre, and price of both books

  Scenario: View Bestsellers
    Given the user is on the homepage
    When the bestsellers data is available
    Then the system displays a section titled "Bestsellers" with a list of products including their name, price, and thumbnail image