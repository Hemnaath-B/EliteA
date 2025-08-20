// NOTE: Update XPath and ID selectors as needed for your target website.
package stepDefinitions;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.Select;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import io.cucumber.java.en.Then;

public class BookstoreScenarios {

    private WebDriver driver;

    @Given("I am on the Books category page")
    public void i_am_on_the_books_category_page() {
        driver.get("http://example.com/books");
    }

    @When("I enter the keyword {string} into the search bar and initiate a search")
    public void i_enter_the_keyword_into_the_search_bar_and_initiate_a_search(String keyword) {
        WebElement searchBar = driver.findElement(By.id("search-bar"));
        searchBar.sendKeys(keyword);
        searchBar.submit();
    }

    @Then("I should see books related to {string} displayed")
    public void i_should_see_books_related_to_displayed(String keyword) {
        WebElement results = driver.findElement(By.id("search-results"));
        assert results.getText().contains(keyword);
    }

    @When("I select the category {string} to filter the book listings")
    public void i_select_the_category_to_filter_the_book_listings(String category) {
        Select categoryDropdown = new Select(driver.findElement(By.id("category-dropdown")));
        categoryDropdown.selectByVisibleText(category);
    }

    @Then("I should see only books in the {string} category displayed")
    public void i_should_see_only_books_in_the_category_displayed(String category) {
        WebElement results = driver.findElement(By.id("category-results"));
        assert results.getText().contains(category);
    }

    @Given("I am viewing a book listing")
    public void i_am_viewing_a_book_listing() {
        driver.get("http://example.com/book-listing");
    }

    @When("I click the {string} button for the book {string}")
    public void i_click_the_button_for_the_book(String button, String bookTitle) {
        WebElement bookElement = driver.findElement(By.xpath("//div[text()='" + bookTitle + "']"));
        WebElement buttonElement = bookElement.findElement(By.xpath(".//button[text()='" + button + "']"));
        buttonElement.click();
    }

    @Then("the book {string} should be added to my shopping cart and the cart count should be updated")
    public void the_book_should_be_added_to_my_shopping_cart_and_the_cart_count_should_be_updated(String bookTitle) {
        WebElement cartCount = driver.findElement(By.id("cart-count"));
        assert cartCount.getText().equals("1");
    }

    @Then("the book {string} should be added to my wishlist and the wishlist count should be updated")
    public void the_book_should_be_added_to_my_wishlist_and_the_wishlist_count_should_be_updated(String bookTitle) {
        WebElement wishlistCount = driver.findElement(By.id("wishlist-count"));
        assert wishlistCount.getText().equals("1");
    }

    @Given("I have books in my shopping cart")
    public void i_have_books_in_my_shopping_cart() {
        driver.get("http://example.com/cart");
        WebElement cartCount = driver.findElement(By.id("cart-count"));
        assert !cartCount.getText().equals("0");
    }

    @When("I proceed to checkout from the shopping cart page")
    public void i_proceed_to_checkout_from_the_shopping_cart_page() {
        WebElement checkoutButton = driver.findElement(By.id("checkout-button"));
        checkoutButton.click();
    }

    @Then("I should be able to enter shipping and payment information to complete the purchase and receive a confirmation")
    public void i_should_be_able_to_enter_shipping_and_payment_information_to_complete_the_purchase_and_receive_a_confirmation() {
        WebElement confirmationMessage = driver.findElement(By.id("confirmation-message"));
        assert confirmationMessage.isDisplayed();
    }

    @Given("I am on the book's detail page