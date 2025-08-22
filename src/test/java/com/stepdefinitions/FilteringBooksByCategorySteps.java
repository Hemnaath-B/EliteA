package com.stepdefinitions;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.By;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import io.cucumber.java.en.Then;
import static org.junit.Assert.*;

public class FilteringBooksByCategorySteps {
    private WebDriver driver;
    private WebDriverWait wait;

    public FilteringBooksByCategorySteps() {
        // Initialize WebDriver and WebDriverWait here
        // Example: this.driver = new ChromeDriver();
        // Example: this.wait = new WebDriverWait(driver, 10);
    }

    @Given("I am on the books category page")
    public void i_am_on_the_books_category_page() {
        driver.get("https://demowebshop.tricentis.com/books");
    }

    @When("I look at the page")
    public void i_look_at_the_page() {
        // No actions needed for this step
    }

    @Then("I should see the filter option visible and accessible")
    public void i_should_see_the_filter_option_visible_and_accessible() {
        WebElement filterOption = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("filter-options")));
        assertTrue(filterOption.isDisplayed());
        assertTrue(filterOption.isEnabled());
    }

    @When("I select one category from the filter options")
    public void i_select_one_category_from_the_filter_options() {
        WebElement categoryOption = wait.until(ExpectedConditions.elementToBeClickable(By.xpath("//option[@value='category1']")));
        categoryOption.click();
    }

    @Then("I should see filtered results displaying only books that match the selected category")
    public void i_should_see_filtered_results_displaying_only_books_that_match_the_selected_category() {
        WebElement filteredResults = wait.until(ExpectedConditions.visibilityOfElementLocated(By.className("filtered-results")));
        assertTrue(filteredResults.getText().contains("category1"));
    }

    @When("I select multiple categories from the filter options")
    public void i_select_multiple_categories_from_the_filter_options() {
        WebElement categoryOption1 = wait.until(ExpectedConditions.elementToBeClickable(By.xpath("//option[@value='category1']")));
        categoryOption1.click();
        WebElement categoryOption2 = wait.until(ExpectedConditions.elementToBeClickable(By.xpath("//option[@value='category2']")));
        categoryOption2.click();
    }

    @Then("I should see filtered results displaying only books that match any of the selected categories")
    public void i_should_see_filtered_results_displaying_only_books_that_match_any_of_the_selected_categories() {
        WebElement filteredResults = wait.until(ExpectedConditions.visibilityOfElementLocated(By.className("filtered-results")));
        assertTrue(filteredResults.getText().contains("category1") || filteredResults.getText().contains("category2"));
    }

    @When("I select and deselect categories from the filter options")
    public void i_select_and_deselect_categories_from_the_filter_options() {
        WebElement categoryOption1 = wait.until(ExpectedConditions.elementToBeClickable(By.xpath("//option[@value='category1']")));
        categoryOption1.click();
        WebElement categoryOption2 = wait.until(ExpectedConditions.elementToBeClickable(By.xpath("//option[@value='category2']")));
        categoryOption2.click();
        categoryOption1.click();
    }

    @Then("I should see filtered results update immediately to reflect the selected categories")
    public void i_should_see_filtered_results_update_immediately_to_reflect_the_selected_categories() {
        WebElement filteredResults = wait.until(ExpectedConditions.visibilityOfElementLocated(By.className("filtered-results")));
        assertTrue(filteredResults.getText().contains("category2"));
    }

    @Then("I should see filtered results displaying books with accurate titles, authors, and other relevant details matching the selected categories")
    public void i_should_see_filtered_results_displaying_books_with_accurate_titles_authors_and_other_relevant_details_matching_the_selected_categories() {
        WebElement filteredResults = wait.until(ExpectedConditions.visibilityOfElementLocated(By.className("filtered-results")));