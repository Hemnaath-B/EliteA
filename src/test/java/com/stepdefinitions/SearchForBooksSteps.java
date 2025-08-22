package stepDefinitions;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import io.cucumber.java.en.Then;
import org.junit.Assert;

public class SearchForBooksSteps {

    WebDriver driver;

    @Given("I am on the Books category page")
    public void i_am_on_the_books_category_page() {
        // Initialize the WebDriver and navigate to the Books category page
        System.setProperty("webdriver.chrome.driver", "path/to/chromedriver");
        driver = new ChromeDriver();
        driver.get("http://example.com/books");
    }

    @When("I look at the page")
    public void i_look_at_the_page() {
        // No specific action needed for this step
    }

    @Then("I should see the search bar")
    public void i_should_see_the_search_bar() {
        WebElement searchBar = driver.findElement(By.id("search-bar"));
        Assert.assertTrue(searchBar.isDisplayed());
        driver.quit();
    }

    @When("I enter the keyword {string} into the search bar and initiate the search")
    public void i_enter_the_keyword_into_the_search_bar_and_initiate_the_search(String keyword) {
        WebElement searchBar = driver.findElement(By.id("search-bar"));
        searchBar.sendKeys(keyword);
        searchBar.submit();
    }

    @Then("I should see books related to {string} in the search results")
    public void i_should_see_books_related_to_in_the_search_results(String keyword) {
        WebElement searchResults = driver.findElement(By.id("search-results"));
        Assert.assertTrue(searchResults.getText().contains(keyword));
        driver.quit();
    }

    @When("I leave the search bar empty and initiate the search")
    public void i_leave_the_search_bar_empty_and_initiate_the_search() {
        WebElement searchBar = driver.findElement(By.id("search-bar"));
        searchBar.clear();
        searchBar.submit();
    }

    @Then("I should see no books in the search results and an appropriate message")
    public void i_should_see_no_books_in_the_search_results_and_an_appropriate_message() {
        WebElement searchResults = driver.findElement(By.id("search-results"));
        Assert.assertTrue(searchResults.getText().contains("No results found"));
        driver.quit();
    }

    @When("I enter invalid characters such as {string} into the search bar and initiate the search")
    public void i_enter_invalid_characters_such_as_into_the_search_bar_and_initiate_the_search(String invalidChars) {
        WebElement searchBar = driver.findElement(By.id("search-bar"));
        searchBar.sendKeys(invalidChars);
        searchBar.submit();
    }

    @Then("I should see no books in the search results and an appropriate message")
    public void i_should_see_no_books_in_the_search_results_and_an_appropriate_message() {
        WebElement searchResults = driver.findElement(By.id("search-results"));
        Assert.assertTrue(searchResults.getText().contains("No results found"));
        driver.quit();
    }

    @When("I enter a very long keyword into the search bar and initiate the search")
    public void i_enter_a_very_long_keyword_into_the_search_bar_and_initiate_the_search() {
        WebElement searchBar = driver.findElement(By.id("search-bar"));
        searchBar.sendKeys("a".repeat(1000));
        searchBar.submit();
    }

    @Then("I should see relevant books matching the keyword or an appropriate message")
    public void i_should_see_relevant_books_matching_the_keyword_or_an_appropriate_message() {
        WebElement searchResults = driver.findElement(By.id("search-results"));
        Assert.assertTrue(searchResults.getText().contains("No results found") || searchResults.getText().length() > 0);
        driver.quit();
    }

    @When("I enter the keyword {string} into the search bar and initiate the search")
    public void i_enter