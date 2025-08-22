package com.stepdefinitions;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.By;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import io.cucumber.java.en.Then;
import static org.junit.Assert.*;

public class BookSearchFunctionalitySteps {
    private WebDriver driver;
    private WebDriverWait wait;

    public BookSearchFunctionalitySteps() {
        // Initialize WebDriver and WebDriverWait here
        // Example: this.driver = new ChromeDriver();
        // Example: this.wait = new WebDriverWait(driver, 10);
    }

    @Given("I am on the books category page")
    public void i_am_on_the_books_category_page() {
        driver.get("https://demowebshop.tricentis.com/books");
    }

    @When("I look at the page")
    public void i_look_at_the_page() {
        // No actions needed for this step
    }

    @Then("I should see the search bar visible and accessible")
    public void i_should_see_the_search_bar_visible_and_accessible() {
        WebElement searchBar = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("small-searchterms")));
        assertTrue(searchBar.isDisplayed());
        assertTrue(searchBar.isEnabled());
    }

    @When("I enter {string} in the search bar")
    public void i_enter_in_the_search_bar(String keyword) {
        WebElement searchBar = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("small-searchterms")));
        searchBar.sendKeys(keyword);
        WebElement searchButton = wait.until(ExpectedConditions.elementToBeClickable(By.xpath("//input[@value='Search']")));
        searchButton.click();
    }

    @Then("I should see search results displaying books with titles containing {string}")
    public void i_should_see_search_results_displaying_books_with_titles_containing(String keyword) {
        WebElement searchResults = wait.until(ExpectedConditions.visibilityOfElementLocated(By.className("search-results")));
        assertTrue(searchResults.getText().contains(keyword));
    }

    @Then("I should see search results displaying books written by {string}")
    public void i_should_see_search_results_displaying_books_written_by(String author) {
        WebElement searchResults = wait.until(ExpectedConditions.visibilityOfElementLocated(By.className("search-results")));
        assertTrue(searchResults.getText().contains(author));
    }

    @Then("I should see search results displaying books belonging to the {string} genre")
    public void i_should_see_search_results_displaying_books_belonging_to_the_genre(String genre) {
        WebElement searchResults = wait.until(ExpectedConditions.visibilityOfElementLocated(By.className("search-results")));
        assertTrue(searchResults.getText().contains(genre));
    }

    @When("I leave the search bar empty and initiate the search")
    public void i_leave_the_search_bar_empty_and_initiate_the_search() {
        WebElement searchButton = wait.until(ExpectedConditions.elementToBeClickable(By.xpath("//input[@value='Search']")));
        searchButton.click();
    }

    @Then("I should see a message indicating no search keyword was entered or no search results")
    public void i_should_see_a_message_indicating_no_search_keyword_was_entered_or_no_search_results() {
        WebElement searchResults = wait.until(ExpectedConditions.visibilityOfElementLocated(By.className("search-results")));
        assertTrue(searchResults.getText().contains("No results"));
    }

    @Then("I should see no books or a message indicating no relevant books found")
    public void i_should_see_no_books_or_a_message_indicating_no_relevant_books_found() {
        WebElement searchResults = wait.until(ExpectedConditions.visibilityOfElementLocated(By.className("search-results")));
        assertTrue(searchResults.getText().contains("No results"));
    }

    @Then("I should see relevant books if any match the long keyword or a message indicating no relevant books found")
    public void i_should_see_relevant_books_if_any_match_the_long_keyword_or_a_message_indicating_no_re