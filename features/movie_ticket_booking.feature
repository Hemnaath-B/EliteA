Feature: Movie ticket booking
  This feature allows users to book movie tickets by selecting movies and ticket types.

  Scenario: View List of Currently Showing Movies
    Given the user navigates to the movie selection page
    When the user views the page
    Then the system displays a list of currently showing movies

  Scenario: Valid Movie Selection
    Given the user is on the movie selection page
    When the user clicks on a movie title from the list
    Then the selected movie is highlighted and available showtimes are displayed

  Scenario: Invalid Movie Selection
    Given the user is on the movie selection page
    When the user tries to select a movie not listed
    Then the system does not change the display and shows an error message indicating the selection is invalid

  Scenario: No Movies Currently Showing
    Given the user navigates to the movie selection page
    When there are no movies available
    Then the system displays a message indicating that no movies are currently showing

  Scenario: Edge Case - Large Number of Movies
    Given the user navigates to the movie selection page
    When there is a list of 100+ movies
    Then the system displays the complete list of movies without performance issues, and the user can scroll through and select any movie

  Scenario: Edge Case - Special Characters in Movie Titles
    Given the user navigates to the movie selection page
    When there are movies with special characters in their titles
    Then the system correctly displays the movie titles with special characters, and the user can select these movies without issues

  Scenario: Edge Case - Movie Titles with Similar Names
    Given the user navigates to the movie selection page
    When there are movies with similar names
    Then the system correctly displays both movie titles, and the user can distinguish and select the desired movie

  Scenario: Edge Case - Rapid Movie Selection
    Given the user is on the movie selection page
    When the user quickly clicks on multiple movie titles in succession
    Then the system correctly updates the selected movie and displays the showtimes for the last movie clicked, without any errors or delays

  Scenario: Edge Case - Movie Selection with Slow Network
    Given the user is on the movie selection page
    When the user selects a movie from the list while experiencing a slow network connection
    Then the system eventually highlights the selected movie and displays the available showtimes, possibly with a loading indicator to inform the user of the delay

  Scenario: Accessibility Check
    Given the user navigates to the movie selection page using a screen reader
    When the user views the list of currently showing movies
    Then the screen reader correctly reads out the list of movies, and the user can select a movie using keyboard navigation

  Scenario: Valid Ticket Selection
    Given the user is on the ticket selection page
    When the user selects 2 adult tickets, 1 child ticket, and 1 senior ticket
    Then the system displays the selected tickets and their types in the summary, and calculates the total cost correctly

  Scenario: Invalid Ticket Number (Negative)
    Given the user is on the ticket selection page
    When the user selects -1 adult ticket
    Then the system displays an error message indicating that the number of tickets cannot be negative

  Scenario: Invalid Ticket Number (Exceeding Maximum)
    Given the user is on the ticket selection page
    When the user selects 11 adult tickets
    Then the system displays an error message indicating that the number of tickets exceeds the maximum allowed

  Scenario: Valid Ticket Type Selection
    Given the user is on the ticket selection page
    When the user selects 1 adult ticket, 1 child ticket, and 1 senior ticket
    Then the system displays the selected ticket types in the summary and calculates the total cost correctly

  Scenario: Invalid Ticket Type Selection
    Given the user is on the ticket selection page
    When the user tries to select an undefined ticket type
    Then the system displays an error message indicating that the selected ticket type is invalid

  Scenario: Edge Case - Zero Tickets
    Given the user is on the ticket selection page
    When the user selects 0 tickets of any type
    Then the system displays an error message indicating that at least one ticket must be selected

  Scenario: Edge Case - Maximum Ticket Selection
    Given the user is on the ticket selection page
    When the user selects the maximum allowable number of tickets
    Then the system allows the selection and updates the booking summary accordingly, calculating the total cost correctly