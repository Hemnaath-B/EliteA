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

public class BookstoreSearchAndShoppingSteps {

    WebDriver driver;

    @Given("I am on the bookstore homepage")
    public void i_am_on_the_bookstore_homepage() {
        System.setProperty("webdriver.chrome.driver", "path/to/chromedriver");
        driver = new ChromeDriver();
        driver.get("http://bookstore.example.com");
    }

    @When("I search for 'Clean Code'")
    public void i_search_for_clean_code() {
        WebElement searchBox = driver.findElement(By.name("search"));
        searchBox.sendKeys("Clean Code");
        searchBox.submit();
    }

    @Then("I should see 'Clean Code' in the search results")
    public void i_should_see_clean_code_in_the_search_results() {
        WebElement searchResult = driver.findElement(By.xpath("//h2[contains(text(),'Clean Code')]"));
        Assert.assertTrue(searchResult.isDisplayed());
        driver.quit();
    }

    @When("I add 'Clean Code' to the shopping cart")
    public void i_add_clean_code_to_the_shopping_cart() {
        WebElement addToCartButton = driver.findElement(By.xpath("//button[contains(text(),'Add to Cart')]"));
        addToCartButton.click();
    }

    @Then("'Clean Code' should be in the shopping cart")
    public void clean_code_should_be_in_the_shopping_cart() {
        WebElement cartItem = driver.findElement(By.xpath("//div[@id='shopping-cart']//h2