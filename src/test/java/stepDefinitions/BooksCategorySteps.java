// NOTE: Update XPath and ID selectors as needed for your target website.
package stepDefinitions;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import io.cucumber.java.en.Then;

public class BooksCategorySteps {
    private WebDriver driver;
    private WebDriverWait wait;

    public BooksCategorySteps() {
        // Initialize WebDriver and WebDriverWait here
        // Example: this.driver = new ChromeDriver();
        // Example: this.wait = new WebDriverWait(driver, 10);
    }

    @Given("the search bar is visible on the Books category page")
    public void the_search_bar_is_visible_on_the_books_category_page() {
        driver.get("http://example.com/books");
        wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("search-bar")));
    }

    @When("I enter the keyword {string} into the search bar and press Enter")
    public void i_enter_the_keyword_into_the_search_bar_and_press_enter(String keyword) {
        WebElement searchBar = driver.findElement(By.id("search-bar"));
        searchBar.sendKeys(keyword);
        searchBar.submit();
    }

    @Then("a list of books related to the keyword {string} is displayed in the search results")
    public void a_list_of_books_related_to_the_keyword_is_displayed_in_the_search_results(String keyword) {
        wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("search-results")));
        // Additional assertions can be added here to verify the search results
    }

    @Given("filter options for different book categories are available on the Books category page")
    public void filter_options_for_different_book_categories_are_available_on_the_books_category_page() {
        driver.get("http://example.com/books");
        wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("filter-options")));
    }

    @When("I select the {string} category from the filter options")
    public void i_select_the_category_from_the_filter_options(String category) {
        WebElement filterOption = driver.findElement(By.xpath("//button[text()='" + category + "']"));
        filterOption.click();
    }

    @Then("only books belonging to the {string} category are displayed in the book listings")
    public void only_books_belonging_to_the_category_are_displayed_in_the_book_listings(String category) {
        wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("book-listings")));
        // Additional assertions can be added here to verify the filtered book listings
    }

    @Given("each book listing has an {string} button")
    public void each_book_listing_has_an_button(String buttonText) {
        driver.get("http://example.com/books");
        wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//button[text()='" + buttonText + "']")));
    }

    @When("I click the {string} button on a book listing")
    public void i_click_the_button_on_a_book_listing(String buttonText) {
        WebElement addButton = driver.findElement(By.xpath("//button[text()='" + buttonText + "']"));
        addButton.click();
    }

    @Then("the book is added to my shopping cart and the shopping cart icon updates to reflect the number of items added")
    public void the_book_is_added_to_my_shopping_cart_and_the_shopping_cart_icon_updates_to_reflect_the_number_of_items_added() {
        wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("shopping-cart-icon")));
        // Additional assertions can be added here to verify the shopping cart update
    }

    @Then("the book is added to my wishlist and I can view and manage my wishlist from my account")
    public void the_book_is_added_to_my_wishlist_and_i_can_view_and_manage_my_wishlist_from_my_account() {
        wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("wishlist")));
        // Additional assertions can be added here to verify the wishlist update
    }

    @Given("the shopping cart page has a {string} button")
    public void the_shopping_cart_page_has_a_button(String