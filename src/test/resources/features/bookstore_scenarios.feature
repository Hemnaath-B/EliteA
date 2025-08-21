### Scenario: Search for Books Using Keywords
#### Given the search bar is visible on the Books category page
#### When I enter the keyword "fiction" into the search bar and press Enter
#### Then a list of books related to the keyword "fiction" is displayed in the search results

### Scenario: Filter Books by Category
#### Given filter options for different book categories are available on the Books category page
#### When I select the "Fiction" category from the filter options
#### Then only books belonging to the "Fiction" category are displayed in the book listings

### Scenario: Add Books to Cart
#### Given each book listing has an "Add to Cart" button
#### When I click the "Add to Cart" button on a book listing
#### Then the book is added to my shopping cart and the shopping cart icon updates to reflect the number of items added

### Scenario: Add Books to Wishlist
#### Given each book listing has an "Add to Wishlist" button
#### When I click the "Add to Wishlist" button on a book listing
#### Then the book is added to my wishlist and I can view and manage my wishlist from my account

### Scenario: Checkout Books
#### Given the shopping cart page has a "Checkout" button
#### When I click the "Checkout" button
#### Then I am taken to the checkout process where I can enter shipping and payment information to complete the purchase

### Scenario: Review Books
#### Given each book listing has a "Write a Review" option
#### When I enter my review text and rating and submit
#### Then my review is displayed on the book's page after submission

### Scenario: View Book Details
#### Given I am on the Books category page
#### When I click on a book listing
#### Then I am taken to the book's detail page displaying the book's title, author, description, price, and reviews, along with additional information such as publication date and ISBN