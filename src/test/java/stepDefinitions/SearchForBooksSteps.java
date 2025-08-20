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
import static org.junit.Assert.*;

public class SearchForBooksSteps {

    private WebDriver driver;
    private WebDriverWait wait;

    public SearchForBooksSteps() {
        // Initialize WebDriver and WebDriverWait here
        // Example:
        // this.driver = new ChromeDriver();
        // this.wait = new WebDriverWait(driver, 10);
    }

    @Given("I am on the Books category page")
    public void i_am_on_the_books_category_page() {
        driver.get("http://example.com/books");
    }

    @When("I enter {string} in the search bar")
    public void i_enter_in_the_search_bar(String searchString) {
        WebElement searchBar = driver.findElement(By.id("search-bar"));
        searchBar.clear();
        searchBar.sendKeys(searchString);
        searchBar.submit();
    }

    @When("I perform a search with an empty input field")
    public void i_perform_a_search_with_an_empty_input_field() {
        WebElement searchBar = driver.findElement(By.id("search-bar"));
        searchBar.clear();
        searchBar.submit();
    }

    @Then("I should see books with the title {string} including title, author, publication date, and availability status")
    public void i_should_see_books_with_the_title_including_title_author_publication_date_and_availability_status(String title) {
        wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".book-item")));
        assertTrue(driver.findElements(By.cssSelector(".book-title")).stream()
                .allMatch(element -> element.getText().contains(title)));
    }

    @Then("I should see books authored by {string} including title, author, publication date, and availability status")
    public void i_should_see_books_authored_by_including_title_author_publication_date_and_availability_status(String author) {
        wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".book-item")));
        assertTrue(driver.findElements(By.cssSelector(".book-author")).stream()
                .allMatch(element -> element.getText().contains(author)));
    }

    @Then("I should see the book with ISBN {string} including title, author, publication date, and availability status")
    public void i_should_see_the_book_with_isbn_including_title_author_publication_date_and_availability_status(String isbn) {
        wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".book-item")));
        assertTrue(driver.findElements(By.cssSelector(".book-isbn")).stream()
                .anyMatch(element -> element.getText().contains(isbn)));
    }

    @Then("I should see books containing the keyword {string} in the title or description including title, author, publication date, and availability status")
    public void i_should_see_books_containing_the_keyword_in_the_title_or_description_including_title_author_publication_date_and_availability_status(String keyword) {
        wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".book-item")));
        assertTrue(driver.findElements(By.cssSelector(".book-title, .book-description")).stream()
                .anyMatch(element -> element.getText().contains(keyword)));
    }

    @Then("I should see books with titles or descriptions containing {string} including title, author, publication date, and availability status")
    public void i_should_see_books_with_titles_or_descriptions_containing_including_title_author_publication_date_and_availability_status(String partial) {
        wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".book-item")));
        assertTrue(driver.findElements(By.cssSelector(".book-title, .book-description")).stream()
                .anyMatch(element -> element.getText().contains(partial)));
    }

    @Then("I should see a message indicating no results were found")
    public void i_should_see_a_message_indicating