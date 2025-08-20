package stepDefinitions;

// NOTE: Update XPath and ID selectors as needed for your target website

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import io.cucumber.java.en.*;

public class LoginSteps {
    WebDriver driver;

    @Given("I am on the login page")
    public void i_am_on_the_login_page() {
        driver = new ChromeDriver();
        driver.get("https://demowebshop.tricentis.com/login");
    }

    @When("I enter a valid username and password")
    public void i_enter_a_valid_username_and_password() {
        WebElement usernameField = driver.findElement(By.id("Email"));
        WebElement passwordField = driver.findElement(By.id("Password"));
        usernameField.sendKeys("validUsername");
        passwordField.sendKeys("validPassword");
    }

    @And("I click the login button")
    public void i_click_the_login_button() {
        WebElement loginButton = driver.findElement(By.xpath("//input[@value='Log in']"));
        loginButton.click();
    }

    @Then("I should be redirected to the homepage")
    public void i_should_be_redirected_to_the_homepage() {
        String expectedUrl = "https://demowebshop.tricentis.com/";
        String actualUrl = driver.getCurrentUrl();
        assert actualUrl.equals(expectedUrl);
        driver.quit();
    }
}