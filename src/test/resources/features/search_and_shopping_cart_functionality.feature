Feature: Search and Shopping Cart Functionality

  This feature validates the search functionality and shopping cart operations on the e-commerce website.

  ### Scenario: Validate that the search bar is displayed on the homepage
    Given the user navigates to the homepage
    When the homepage is loaded
    Then the search bar is prominently displayed

  ### Scenario: Validate that typing in the search bar shows suggestions
    Given the user is on the homepage
    When the user types "shoes" in the search bar
    Then suggestions related to "shoes" are displayed as the user types

  ### Scenario: Validate that pressing 'Enter' executes the search
    Given the user is on the homepage
    When the user types "shoes" in the search bar and presses 'Enter'
    Then the search results page displays products related to "shoes"

  ### Scenario: Validate that clicking the 'Search' button executes the search
    Given the user is on the homepage
    When the user types "shoes" in the search bar and clicks the 'Search' button
    Then the search results page displays products related to "shoes"

  ### Scenario: Validate that relevant products are displayed based on the search query
    Given the user is on the homepage
    When the user types "running shoes" in the search bar and executes the search
    Then the search results page displays products related to "running shoes"

  ### Scenario: Validate that a message is displayed when no products match the search query
    Given the user is on the homepage
    When the user types "xyzabc" in the search bar and executes the search
    Then a message indicating no results were found is displayed

  ### Scenario: Validate that the search handles common typos and returns relevant results
    Given the user is on the homepage
    When the user types "shoess" in the search bar and executes the search
    Then the search results page displays products related to "shoes"

  ### Scenario: Validate that the search supports special characters and numbers
    Given the user is on the homepage
    When the user types "shoe#123" in the search bar and executes the search
    Then the search results page displays products related to "shoe#123"

  ### Scenario: Validate that the search is case-insensitive
    Given the user is on the homepage
    When the user types "SHOES" in the search bar and executes the search
    Then the search results page displays products related to "shoes"

  ### Scenario: Validate that the search bar handles an empty input gracefully
    Given the user is on the homepage
    When the user leaves the search bar empty and presses 'Enter' or clicks the 'Search' button
    Then no search is executed, and the user remains on the current page

  ### Scenario: Validate that the search bar handles extremely long input
    Given the user is on the homepage
    When the user types a very long string (e.g., 500 characters) in the search bar and executes the search
    Then the search results page displays products related to the input, or a message indicating no results were found if the input is nonsensical

  ### Scenario: Validate that the search bar handles rapid consecutive searches
    Given the user is on the homepage
    When the user types "shoes" in the search bar, executes the search, then immediately types "socks" and executes the search
    Then the search results page first displays products related to "shoes", then updates to display products related to "socks"

  ### Scenario: Validate that an item can be added to the shopping cart from the product page
    Given the user navigates to a product page
    When the user clicks the "Add to Cart" button
    Then the item is added to the shopping cart, and the cart icon updates to reflect the added item

  ### Scenario: Validate that the shopping cart updates to reflect the added item
    Given the user adds an item to the shopping cart
    When the user views the shopping cart
    Then the shopping cart displays the newly added item with its details (name, price, quantity)

  ### Scenario: Validate that the user can view the shopping cart with the added items
    Given the user has added items to the shopping cart
    When the user clicks on the shopping cart icon
    Then the shopping cart page opens, displaying all items added to the cart

  ### Scenario: Validate that multiple items can be added to the shopping cart
    Given the user adds multiple items to the shopping cart from different product pages
    When the user views the shopping cart
    Then the shopping cart displays all added items with their respective details

  ### Scenario: Validate that the user can remove items from the shopping cart
    Given the user has items in the shopping cart
    When the user clicks the "Remove" button next to an item
    Then the item is removed from the shopping cart, and the cart updates to reflect the removal

  ### Scenario: Validate that the total price of items in the shopping cart is displayed correctly
    Given the user has added multiple items to the shopping cart