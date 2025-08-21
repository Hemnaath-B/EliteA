package stepDefinitions;

// NOTE: Update XPath and ID selectors as needed for your target website.

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.Select;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import io.cucumber.java.en.Then;
import static org.junit.Assert.assertTrue;

public class SearchAndFilterBooksSteps {
    WebDriver driver;

    @Given("I am on the Books category page")
    public void i_am_on_the_books_category_page() {
        driver.get("http://example.com/books");
    }

    @When("I enter {string} in the search bar")
    public void i_enter_in_the_search_bar(String searchText) {
        WebElement searchBar = driver.findElement(By.id("searchBar"));
        searchBar.sendKeys(searchText);
        searchBar.submit();
    }

    @When("I leave the search bar empty and click search")
    public void i_leave_the_search_bar_empty_and_click_search() {
        WebElement searchBar = driver.findElement(By.id("searchBar"));
        searchBar.clear();
        searchBar.submit();
    }

    @When("I select a category from the dropdown menu")
    public void i_select_a_category_from_the_dropdown_menu() {
        Select categoryDropdown = new Select(driver.findElement(By.id("categoryDropdown")));
        categoryDropdown.selectByIndex(1); // Example: selecting the first category
    }

    @When("I clear the selected category filter")
    public void i_clear_the_selected_category_filter() {
        Select categoryDropdown = new Select(driver.findElement(By.id("categoryDropdown")));
        categoryDropdown.selectByIndex(0); // Example: clearing the filter by selecting the default option
    }

    @Then("I should see books with the title {string} including title, author, ISBN, genre, and availability status")
    public void i_should_see_books_with_the_title_including_title_author_isbn_genre_and_availability_status(String title) {
        assertTrue(driver.findElement(By.xpath("//div[contains(text(), '" + title + "')]")).isDisplayed());
    }

    @Then("I should see books authored by {string} including title, author, ISBN, genre, and availability status")
    public void i_should_see_books_authored_by_including_title_author_isbn_genre_and_availability_status(String author) {
        assertTrue(driver.findElement(By.xpath("//div[contains(text(), '" + author + "')]")).isDisplayed());
    }

    @Then("I should see books with the ISBN {string} including title, author, ISBN, genre, and availability status")
    public void i_should_see_books_with_the_isbn_including_title_author_isbn_genre_and_availability_status(String isbn) {
        assertTrue(driver.findElement(By.xpath("//div[contains(text(), '" + isbn + "')]")).isDisplayed());
    }

    @Then("I should see books in the {string} genre including title, author, ISBN, genre, and availability status")
    public void i_should_see_books_in_the_genre_including_title_author_isbn_genre_and_availability_status(String genre) {
        assertTrue(driver.findElement(By.xpath("//div[contains(text(), '" + genre + "')]")).isDisplayed());
    }

    @Then("I should see a message indicating no results found")
    public void i_should_see_a_message_indicating_no_results_found() {
        assertTrue(driver.findElement(By.id("noResultsMessage")).isDisplayed());
    }

    @Then("the list of books updates to show only books from the selected category")
    public void the_list_of_books_updates_to_show_only_books_from_the_selected_category() {
        assertTrue(driver.findElement(By.id("filteredBooksList")).isDisplayed());
    }
}
