package stepDefinitions;

// NOTE: Update XPath and ID selectors as needed for your target website.

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import io.cucumber.java.en.Then;

public class LoginFunctionalitySteps {

    WebDriver driver;

    @Given("user is on the login page")
    public void user_is_on_the_login_page() {
        System.setProperty("webdriver.chrome.driver", "path/to/chromedriver");
        driver = new ChromeDriver();
        driver.get("http://example.com/login");
    }

    @When("user enters valid credentials")
    public void user_enters_valid_credentials() {
        WebElement usernameField = driver.findElement(By.id("username"));
        WebElement passwordField = driver.findElement(By.id("password"));
        WebElement loginButton = driver.findElement(By.id("loginButton"));

        usernameField.sendKeys("validUsername");
        passwordField.sendKeys("validPassword");
        loginButton.click();
    }

    @Then("user is redirected to the homepage")
    public void user_is_redirected_to_the_homepage() {
        String expectedUrl = "http://example.com/home";
        String actualUrl = driver.getCurrentUrl();
        if (!expectedUrl.equals(actualUrl)) {
            throw new AssertionError("User is not redirected to the homepage");
        }
        driver.quit();
    }
}
