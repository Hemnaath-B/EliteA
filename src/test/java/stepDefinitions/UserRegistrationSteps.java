// NOTE: Update XPath and ID selectors as needed for your target website.
package stepDefinitions;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import io.cucumber.java.en.*;

public class UserRegistrationSteps {
    WebDriver driver;

    @Given("the user is on the registration page")
    public void the_user_is_on_the_registration_page() {
        driver = new ChromeDriver();
        driver.get("http://example.com/registration");
    }

    @When("the user enters {string} as First Name, {string} as Last Name, {string} as Email, {string} as Password, and {string} as Confirm Password")
    public void the_user_enters_as_First_Name_as_Last_Name_as_Email_as_Password_and_as_Confirm_Password(String firstName, String lastName, String email, String password, String confirmPassword) {
        driver.findElement(By.id("firstName")).sendKeys(firstName);
        driver.findElement(By.id("lastName")).sendKeys(lastName);
        driver.findElement(By.id("email")).sendKeys(email);
        driver.findElement(By.id("password")).sendKeys(password);
        driver.findElement(By.id("confirmPassword")).sendKeys(confirmPassword);
        driver.findElement(By.id("registerButton")).click();
    }

    @Then("the user is registered successfully")
    public void the_user_is_registered_successfully() {
        WebElement successMessage = driver.findElement(By.id("successMessage"));
        assert(successMessage.isDisplayed());
    }

    @Then("the user receives a confirmation email")
    public void the_user_receives_a_confirmation_email() {
        // Simulate checking email inbox for confirmation email
        boolean emailReceived = checkEmailInboxForConfirmation();
        assert(emailReceived);
    }

    @Then("the user can log in using the registered email and password")
    public void the_user_can_log_in_using_the_registered_email_and_password() {
        driver.findElement(By.id("loginEmail")).sendKeys("registeredEmail@example.com");
        driver.findElement(By.id("loginPassword")).sendKeys("registeredPassword");
        driver.findElement(By.id("loginButton")).click();
        WebElement dashboard = driver.findElement(By.id("dashboard"));
        assert(dashboard.isDisplayed());
    }

    @Given("the user is registered with {string} as First Name, {string} as Last Name, {string} as Email, {string} as Password, and {string} as Confirm Password")
    public void the_user_is_registered_with_as_First_Name_as_Last_Name_as_Email_as_Password_and_as_Confirm_Password(String firstName, String lastName, String email, String password, String confirmPassword) {
        // Simulate user registration
        registerUser(firstName, lastName, email, password, confirmPassword);
    }

    @When("the user attempts to log in with {string} as Email and {string} as Password")
    public void the_user_attempts_to_log_in_with_as_Email_and_as_Password(String email, String password) {
        driver.findElement(By.id("loginEmail")).sendKeys(email);
        driver.findElement(By.id("loginPassword")).sendKeys(password);
        driver.findElement(By.id("loginButton")).click();
    }

    @Then("the user is able to log in successfully")
    public void the_user_is_able_to_log_in_successfully() {
        WebElement dashboard = driver.findElement(By.id("dashboard"));
        assert(dashboard.isDisplayed());
    }

    @Then("the registration fails with an error message indicating the First Name field is required")
    public void the_registration_fails_with_an_error_message_indicating_the_First_Name_field_is_required() {
        WebElement errorMessage = driver.findElement(By.id("firstNameError"));
        assert(errorMessage.isDisplayed());
    }

    @Then("the registration fails with an error message indicating the Email field is invalid")
    public void the_registration_fails_with_an_error_message_indicating_the_Email_field_is_invalid() {
        WebElement errorMessage = driver.findElement(By.id("emailError"));
        assert(errorMessage.isDisplayed());
    }

    @Then("the registration fails with