import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.chrome.ChromeDriver;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import io.cucumber.java.en.Then;
import static org.junit.Assert.*;

public class BookstoreFunctionalities {

    WebDriver driver;

    @Given("the search bar is visible on the homepage")
    public void the_search_bar_is_visible_on_the_homepage() {
        driver = new ChromeDriver();
        driver.get("http://bookstore.com");
        WebElement searchBar = driver.findElement(By.id("search-bar"));
        assertTrue(searchBar.isDisplayed());
    }

    @When("I enter a book title {string} in the search bar")
    public void i_enter_a_book_title_in_the_search_bar(String bookTitle) {
        WebElement searchBar = driver.findElement(By.id("search-bar"));
        searchBar.sendKeys(bookTitle);
        searchBar.submit();
    }

    @Then("I should see a list of books matching the title {string}")
    public void i_should_see_a_list_of_books_matching_the_title(String bookTitle) {
        WebElement searchResults = driver.findElement(By.id("search-results"));
        assertTrue(searchResults.getText().contains(bookTitle));
        driver.quit();
    }

    @Given("the list of categories is displayed on the book list page")
    public void the_list_of_categories_is_displayed_on_the_book_list_page() {
        driver = new ChromeDriver();
        driver.get("http://bookstore.com/book-list");
        WebElement categoryList = driver.findElement(By.id("category-list"));
        assertTrue(categoryList.isDisplayed());
    }

    @When("I select the category {string}")
    public void i_select_the_category(String category) {
        WebElement categoryDropdown = driver.findElement(By.id("category-dropdown"));
        Select select = new Select(categoryDropdown);
        select.selectByVisibleText(category);
    }

    @Then("I should see books belonging to the {string} category")
    public void i_should_see_books_belonging_to_the_category(String category) {
        WebElement bookList = driver.findElement(By.id("book-list"));
        assertTrue(bookList.getText().contains(category));
        driver.quit();
    }

    @Given("I am on the book details page")
    public void i_am_on_the_book_details_page() {
        driver = new ChromeDriver();
        driver.get("http://bookstore.com/book-details");
    }

    @When("I click {string}")
    public void i_click(String button) {
        WebElement addButton = driver.findElement(By.id(button.toLowerCase().replace(" ", "-")));
        addButton.click();
    }

    @Then("the book should be added to my cart and the number of items in the cart should update")
    public void the_book_should_be_added_to_my_cart_and_the_number_of_items_in_the_cart_should_update() {
        WebElement cartCount = driver.findElement(By.id("cart-count"));
        assertTrue(Integer.parseInt(cartCount.getText()) > 0);
        driver.quit();
    }

    @Given("I am logged in and on the book details page")
    public void i_am_logged_in_and_on_the_book_details_page() {
        driver = new ChromeDriver();
        driver.get("http://bookstore.com/login");
        WebElement username = driver.findElement(By.id("username"));
        WebElement password = driver.findElement(By.id("password"));
        username.sendKeys("user");
        password.sendKeys("password");
        driver.findElement(By.id("login-button")).click();
        driver.get("http://bookstore.com/book-details");
    }

    @Then("the book should be added to my wishlist and a confirmation message should be displayed")
    public void the_book_should_be_added_to_my_wishlist_and_a_confirmation_message_should_be_displayed() {
        WebElement confirmationMessage = driver.findElement(By.id("confirmation-message"));
       