// NOTE: Update XPath and ID selectors as needed for your target website.
package stepDefinitions;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import io.cucumber.java.en.Then;
import org.junit.Assert;

public class SearchAndShoppingCartFunctionalitySteps {

    WebDriver driver;

    @Given("the user navigates to the homepage")
    public void the_user_navigates_to_the_homepage() {
        driver = new ChromeDriver();
        driver.get("http://ecommerce-website.com");
    }

    @When("the homepage is loaded")
    public void the_homepage_is_loaded() {
        Assert.assertTrue(driver.getTitle().contains("Home"));
    }

    @Then("the search bar is prominently displayed")
    public void the_search_bar_is_prominently_displayed() {
        WebElement searchBar = driver.findElement(By.id("search-bar"));
        Assert.assertTrue(searchBar.isDisplayed());
    }

    @Given("the user is on the homepage")
    public void the_user_is_on_the_homepage() {
        driver = new ChromeDriver();
        driver.get("http://ecommerce-website.com");
    }

    @When("the user types {string} in the search bar")
    public void the_user_types_in_the_search_bar(String query) {
        WebElement searchBar = driver.findElement(By.id("search-bar"));
        searchBar.sendKeys(query);
    }

    @Then("suggestions related to {string} are displayed as the user types")
    public void suggestions_related_to_are_displayed_as_the_user_types(String query) {
        WebElement suggestions = driver.findElement(By.id("suggestions"));
        Assert.assertTrue(suggestions.getText().contains(query));
    }

    @When("the user types {string} in the search bar and presses 'Enter'")
    public void the_user_types_in_the_search_bar_and_presses_enter(String query) {
        WebElement searchBar = driver.findElement(By.id("search-bar"));
        searchBar.sendKeys(query);
        searchBar.sendKeys(Keys.RETURN);
    }

    @Then("the search results page displays products related to {string}")
    public void the_search_results_page_displays_products_related_to(String query) {
        WebElement results = driver.findElement(By.id("search-results"));
        Assert.assertTrue(results.getText().contains(query));
    }

    @When("the user types {string} in the search bar and clicks the 'Search' button")
    public void the_user_types_in_the_search_bar_and_clicks_the_search_button(String query) {
        WebElement searchBar = driver.findElement(By.id("search-bar"));
        searchBar.sendKeys(query);
        WebElement searchButton = driver.findElement(By.id("search-button"));
        searchButton.click();
    }

    @When("the user types {string} in the search bar and executes the search")
    public void the_user_types_in_the_search_bar_and_executes_the_search(String query) {
        WebElement searchBar = driver.findElement(By.id("search-bar"));
        searchBar.sendKeys(query);
        searchBar.sendKeys(Keys.RETURN);
    }

    @Then("a message indicating no results were found is displayed")
    public void a_message_indicating_no_results_were_found_is_displayed() {
        WebElement noResultsMessage = driver.findElement(By.id("no-results-message"));
        Assert.assertTrue(noResultsMessage.isDisplayed());
    }

    @When("the user leaves the search bar empty and presses 'Enter' or clicks the 'Search' button")
    public void the_user_leaves_the_search_bar_empty_and_presses_enter_or_clicks_the_search_button() {
        WebElement searchBar = driver.findElement(By.id("search-bar"));
        searchBar.sendKeys("");
        searchBar.sendKeys(Keys.RETURN);
    }

    @Then("no search is executed, and the user remains on the current page")
    public void no_search_is_executed_and_the_user_remains_on_the