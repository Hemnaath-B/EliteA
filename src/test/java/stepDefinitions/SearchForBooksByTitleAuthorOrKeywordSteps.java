// NOTE: Update XPath and ID selectors as needed for your target website.
package stepDefinitions;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.Select;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import io.cucumber.java.en.Then;
import static org.junit.Assert.*;

public class SearchForBooksByTitleAuthorOrKeywordSteps {

    WebDriver driver;

    @Given("the customer is on the Books category page")
    public void the_customer_is_on_the_books_category_page() {
        driver.get("http://example.com/books");
    }

    @When("the customer enters {string} into the search bar")
    public void the_customer_enters_into_the_search_bar(String query) {
        WebElement searchBar = driver.findElement(By.id("search-bar"));
        searchBar.sendKeys(query);
        searchBar.submit();
    }

    @Then("relevant books with the title {string} are displayed in the search results")
    public void relevant_books_with_the_title_are_displayed_in_the_search_results(String title) {
        WebElement results = driver.findElement(By.id("search-results"));
        assertTrue(results.getText().contains(title));
    }

    @Then("relevant books by the author {string} are displayed in the search results")
    public void relevant_books_by_the_author_are_displayed_in_the_search_results(String author) {
        WebElement results = driver.findElement(By.id("search-results"));
        assertTrue(results.getText().contains(author));
    }

    @Then("relevant books related to {string} are displayed in the search results")
    public void relevant_books_related_to_are_displayed_in_the_search_results(String keyword) {
        WebElement results = driver.findElement(By.id("search-results"));
        assertTrue(results.getText().contains(keyword));
    }

    @Then("a message indicating {string} is displayed")
    public void a_message_indicating_is_displayed(String message) {
        WebElement noResultsMessage = driver.findElement(By.id("no-results-message"));
        assertEquals(message, noResultsMessage.getText());
    }

    @When("the customer selects the category {string}")
    public void the_customer_selects_the_category(String category) {
        Select categoryDropdown = new Select(driver.findElement(By.id("category-dropdown")));
        categoryDropdown.selectByVisibleText(category);
    }

    @Then("only books that belong to the {string} category are displayed")
    public void only_books_that_belong_to_the_category_are_displayed(String category) {
        WebElement results = driver.findElement(By.id("category-results"));
        assertTrue(results.getText().contains(category));
    }

    @When("the customer selects the categories {string} and {string}")
    public void the_customer_selects_the_categories_and(String category1, String category2) {
        Select categoryDropdown = new Select(driver.findElement(By.id("category-dropdown")));
        categoryDropdown.selectByVisibleText(category1);
        categoryDropdown.selectByVisibleText(category2);
    }

    @Then("only books that belong to either the {string} or {string} categories are displayed")
    public void only_books_that_belong_to_either_the_or_categories_are_displayed(String category1, String category2) {
        WebElement results = driver.findElement(By.id("category-results"));
        assertTrue(results.getText().contains(category1) || results.getText().contains(category2));
    }

    @When("the customer selects a category that has no books associated with it")
    public void the_customer_selects_a_category_that_has_no_books_associated_with_it() {
        Select categoryDropdown = new Select(driver.findElement(By.id("category-dropdown")));
        categoryDropdown.selectByVisibleText("Empty Category");
    }

    @Given("the customer is on the book details page")
    public void the_customer_is_on_the_book_details_page() {
        driver.get("http://example.com/book-details");
    }

    @When("the customer clicks the {string} button")
    public void the_customer_clicks_the_button(String button) {
        Web