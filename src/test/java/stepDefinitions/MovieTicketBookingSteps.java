package stepDefinitions;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import io.cucumber.java.en.Then;
import org.junit.Assert;

public class MovieTicketBookingSteps {
    WebDriver driver;

    @Given("the user is on the movie selection page")
    public void user_is_on_movie_selection_page() {
        driver = new ChromeDriver();
        driver.get("http://example.com/movies");
    }

    @When("the user clicks on the title of the movie {string}")
    public void user_clicks_on_movie_title(String movieTitle) {
        WebElement movieElement = driver.findElement(By.xpath("//h2[text()='" + movieTitle + "']"));
        movieElement.click();
    }

    @Then("the selected movie {string} should be highlighted and the available showtimes should be displayed")
    public void selected_movie_should_be_highlighted(String movieTitle) {
        WebElement movieElement = driver.findElement(By.xpath("//h2[text()='" + movieTitle + "']"));
        Assert.assertTrue(movieElement.getAttribute("class").contains("highlighted"));
        WebElement showtimesElement = driver.findElement(By.id("showtimes"));
        Assert.assertTrue(showtimesElement.isDisplayed());
    }

    @When("the user tries to select a movie not listed")
    public void user_tries_to_select_movie_not_listed() {
        WebElement movieElement = driver.findElement(By.xpath("//h2[text()='NonExistentMovie']"));
        movieElement.click();
    }

    @Then("no change in the display should occur and an error message should be shown indicating the selection is invalid")
    public void no_change_in_display_should_occur() {
        WebElement errorMessageElement = driver.findElement(By.id("error-message"));
        Assert.assertTrue(errorMessageElement.isDisplayed());
        Assert.assertEquals("Invalid movie selection", errorMessageElement.getText());
    }

    @Given("the user has selected the movie {string}")
    public void user_has_selected_movie(String movieTitle) {
        user_is_on_movie_selection_page();
        user_clicks_on_movie_title(movieTitle);
    }

    @When("the user selects the showtime {string} for the movie {string}")
    public void user_selects_showtime_for_movie(String showtime, String movieTitle) {
        WebElement showtimeElement = driver.findElement(By.xpath("//button[text()='" + showtime + "']"));
        showtimeElement.click();
    }

    @Then("the selected showtime {string} should be highlighted and available seats should be displayed")
    public void selected_showtime_should_be_highlighted(String showtime) {
        WebElement showtimeElement = driver.findElement(By.xpath("//button[text()='" + showtime + "']"));
        Assert.assertTrue(showtimeElement.getAttribute("class").contains("highlighted"));
        WebElement seatsElement = driver.findElement(By.id("seats"));
        Assert.assertTrue(seatsElement.isDisplayed());
    }

    @When("the user tries to select a showtime not available for {string}")
    public void user_tries_to_select_showtime_not_available(String movieTitle) {
        WebElement showtimeElement = driver.findElement(By.xpath("//button[text()='NonExistentShowtime']"));
        showtimeElement.click();
    }

    @Then("no change in the display should occur and an error message should be shown indicating the selection is invalid")
    public void no_change_in_display_should_occur_showtime() {
        WebElement errorMessageElement = driver.findElement(By.id("error-message"));
        Assert.assertTrue(errorMessageElement.isDisplayed());
        Assert.assertEquals("Invalid showtime selection", errorMessageElement.getText());
    }

    @Given("the user has selected the showtime {string} for the movie {string}")
    public void user_has_selected_showtime_for_movie(String showtime, String movieTitle) {
        user_has_selected_movie(movieTitle);
        user_selects_showtime_for