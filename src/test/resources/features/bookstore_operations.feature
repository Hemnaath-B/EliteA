### Feature: Bookstore Operations

### Scenario: Search for Books by Title, Author, or Keyword
  Given the customer is on the Books category page
  When the customer enters "Harry Potter" into the search bar
  Then relevant books with the title "Harry Potter" are displayed in the search results

### Scenario: Search for Books by Author
  Given the customer is on the Books category page
  When the customer enters "J.K. Rowling" into the search bar
  Then relevant books by the author "J.K. Rowling" are displayed in the search results

### Scenario: Search for Books by Keyword
  Given the customer is on the Books category page
  When the customer enters "magic" into the search bar
  Then relevant books related to "magic" are displayed in the search results

### Scenario: No Search Results Found
  Given the customer is on the Books category page
  When the customer enters "Nonexistent Book" into the search bar
  Then a message indicating "No results found" is displayed

### Scenario: Filter Books by Single Category
  Given the customer is on the Books category page
  When the customer selects the category "Fantasy"
  Then only books that belong to the "Fantasy" category are displayed

### Scenario: Filter Books by Multiple Categories
  Given the customer is on the Books category page
  When the customer selects the categories "Fantasy" and "Adventure"
  Then only books that belong to either the "Fantasy" or "Adventure" categories are displayed

### Scenario: No Books Match Selected Categories
  Given the customer is on the Books category page
  When the customer selects a category that has no books associated with it
  Then a message indicating "No results found" is displayed

### Scenario: Add Book to Cart
  Given the customer is on the book details page
  When the customer clicks the "Add to Cart" button
  Then the book is added to the shopping cart
  And a confirmation message is displayed

### Scenario: Add Book to Wishlist
  Given the customer is logged in and on the book details page
  When the customer clicks the "Add to Wishlist" button
  Then the book is added to the wishlist
  And a confirmation message is displayed

### Scenario: View Book Details
  Given the customer is on the Books category page
  When the customer clicks on a book title
  Then the book details page is displayed with the title, author, description, price, and reviews

### Scenario: Write a Book Review
  Given the customer is logged in and on the book details page
  When the customer clicks the "Write a Review" button
  And submits a review with a rating and comments
  Then the review is displayed on the book details page

### Scenario: Complete Checkout Process
  Given the customer has books in their shopping cart
  When the customer clicks the "Checkout" button
  And enters shipping information, selects a payment method, and reviews the order
  Then an order confirmation is displayed after completing the checkout process

### Scenario: View and Manage Cart
  Given the customer has books in their shopping cart
  When the customer clicks the "View Cart" option
  Then the customer can see a list of all items in the cart with their quantities and prices
  And the customer can update the quantity or remove items from the cart

### Scenario: Apply Discount Code
  Given the customer is in the checkout process
  When the customer enters a valid discount code
  Then the discount is applied to the order total
  And the updated order total is displayed