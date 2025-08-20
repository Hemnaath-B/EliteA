// NOTE: Update XPath and ID selectors as needed for your target website.

package stepDefinitions;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.And;
import static org.junit.Assert.assertTrue;

public class LoginFeatureSteps {
    WebDriver driver;

    @Given("User is on the Login page")
    public void user_is_on_the_login_page() {
        System.setProperty("webdriver.chrome.driver", "path/to/chromedriver");
        driver = new ChromeDriver();
        driver.get("https://demowebshop.tricentis.com/login");
    }

    @When("User enters valid username and password")
    public void user_enters_valid_username_and_password() {
        driver.findElement(By.id("Email")).sendKeys("valid_user@example.com");
        driver.findElement(By.id("Password")).sendKeys("valid_password");
    }

    @And("User clicks on the Login button")
    public void user_clicks_on_the_login_button() {
        driver.findElement(By.cssSelector("input.login-button")).click();
    }

    @Then("User is navigated to the Home page")
    public void user_is_navigated_to_the_home_page() {
        assertTrue(driver.findElement(By.cssSelector("a.account")).isDisplayed());
        driver.quit();
    }
}
