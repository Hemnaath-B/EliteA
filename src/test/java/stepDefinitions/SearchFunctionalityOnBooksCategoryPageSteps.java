// NOTE: Update XPath and ID selectors as needed for your target website.
package stepDefinitions;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import io.cucumber.java.en.Then;
import java.util.List;

public class SearchFunctionalityOnBooksCategoryPageSteps {
    WebDriver driver;

    @Given("I am on the Books category page")
    public void i_am_on_the_books_category_page() {
        driver = new ChromeDriver();
        driver.get("http://example.com/books");
    }

    @When("I enter the full title of a book in the search bar")
    public void i_enter_the_full_title_of_a_book_in_the_search_bar() {
        WebElement searchBar = driver.findElement(By.id("searchBar"));
        searchBar.sendKeys("Full Book Title");
        searchBar.submit();
    }

    @When("I enter a partial title of a book in the search bar")
    public void i_enter_a_partial_title_of_a_book_in_the_search_bar() {
        WebElement searchBar = driver.findElement(By.id("searchBar"));
        searchBar.sendKeys("Partial Title");
        searchBar.submit();
    }

    @When("I enter the full name of an author in the search bar")
    public void i_enter_the_full_name_of_an_author_in_the_search_bar() {
        WebElement searchBar = driver.findElement(By.id("searchBar"));
        searchBar.sendKeys("Full Author Name");
        searchBar.submit();
    }

    @When("I enter a partial name of an author in the search bar")
    public void i_enter_a_partial_name_of_an_author_in_the_search_bar() {
        WebElement searchBar = driver.findElement(By.id("searchBar"));
        searchBar.sendKeys("Partial Author Name");
        searchBar.submit();
    }

    @When("I enter the full ISBN of a book in the search bar")
    public void i_enter_the_full_isbn_of_a_book_in_the_search_bar() {
        WebElement searchBar = driver.findElement(By.id("searchBar"));
        searchBar.sendKeys("1234567890123");
        searchBar.submit();
    }

    @When("I enter a title, author, or ISBN in mixed case in the search bar")
    public void i_enter_a_title_author_or_isbn_in_mixed_case_in_the_search_bar() {
        WebElement searchBar = driver.findElement(By.id("searchBar"));
        searchBar.sendKeys("MiXeD CaSe QuErY");
        searchBar.submit();
    }

    @When("I enter a search query that does not match any book in the search bar")
    public void i_enter_a_search_query_that_does_not_match_any_book_in_the_search_bar() {
        WebElement searchBar = driver.findElement(By.id("searchBar"));
        searchBar.sendKeys("NoMatchingQuery");
        searchBar.submit();
    }

    @When("I enter an invalid ISBN format in the search bar")
    public void i_enter_an_invalid_isbn_format_in_the_search_bar() {
        WebElement searchBar = driver.findElement(By.id("searchBar"));
        searchBar.sendKeys("InvalidISBN");
        searchBar.submit();
    }

    @When("I enter a search query with special characters in the search bar")
    public void i_enter_a_search_query_with_special_characters_in_the_search_bar() {
        WebElement searchBar = driver.findElement(By.id("searchBar"));
        searchBar.sendKeys("@#$%^&*");
        searchBar.submit();
    }

    @When("I leave the search bar empty and initiate a search")
    public void i_leave_the_search_bar_empty_and_initiate_a_search() {
        WebElement searchBar = driver.findElement(By.id("searchBar"));
        searchBar.sendKeys("");
        searchBar.submit();
    }

    @When("I enter a single character in the search bar")
    public