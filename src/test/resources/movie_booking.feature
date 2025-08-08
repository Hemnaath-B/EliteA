Feature: Movie Booking

  This feature allows users to select movies, showtimes, and seats, and complete the booking process with various validations and edge case handling.

  Scenario: Valid Movie Selection
    Given the user is on the movie selection page
    When the user clicks on the title of an available movie
    Then the selected movie should be highlighted and the available showtimes should be displayed

  Scenario: Invalid Movie Selection
    Given the user is on the movie selection page
    When the user tries to select a movie not listed
    Then no change in the display should occur and an error message should be shown indicating the selection is invalid

  Scenario: Select Showtime for Movie
    Given the user has selected a movie
    When the user selects a valid showtime for the movie
    Then the selected showtime should be highlighted and available seats should be displayed

  Scenario: Invalid Showtime Selection
    Given the user has selected a movie
    When the user tries to select a showtime that is not available for the chosen movie
    Then no change in the display should occur and an error message should be shown indicating the selection is invalid

  Scenario: Select Seats
    Given the user has selected a showtime for a movie
    When the user selects available seats for the chosen showtime
    Then the selected seats should be highlighted and the booking summary should be updated with the selected seats

  Scenario: Invalid Seat Selection
    Given the user has selected a showtime for a movie
    When the user tries to select seats that are already booked or unavailable
    Then no change in the display should occur and an error message should be shown indicating the selection is invalid

  Scenario: Booking Confirmation
    Given the user has completed the seat selection
    When the user proceeds to finalize the booking
    Then the booking should be confirmed on-screen and a confirmation email should be sent to the user's email address

  Scenario: Edge Case - Maximum Seat Selection
    Given the user is selecting seats for a movie
    When the user selects the maximum allowable number of seats
    Then the system should allow the selection and update the booking summary accordingly

  Scenario: Edge Case - No Seats Selected
    Given the user has selected a showtime for a movie
    When the user tries to proceed to booking without selecting any seats
    Then the system should prevent the user from proceeding and display an error message indicating that seat selection is required

  Scenario: Edge Case - Session Timeout
    Given the user is in the process of selecting seats for a movie
    When the session times out due to inactivity
    Then the system should log the user out, any selections made should be lost, and the user should be prompted to log in again to restart the booking process

  Scenario: Edge Case - Network Interruption
    Given the user is in the process of selecting seats or confirming the booking
    When the network connection is lost
    Then the system should display an error message indicating a network issue and prompt the user to retry or check their connection

  Scenario: Edge Case - Duplicate Booking Attempt
    Given the user has already booked seats for a showtime
    When the user tries to book the same seats for the same showtime again
    Then the system should prevent the duplicate booking and display an error message indicating that the seats are already booked

  Scenario: Edge Case - Invalid Email Format
    Given the user is entering their email address during the booking process
    When the user enters an invalid email address format
    Then the system should display an error message indicating the invalid email format and prompt the user to enter a valid email address

  Scenario: Edge Case - Booking Cancellation
    Given the user is in the process of booking seats for a movie
    When the user cancels the booking process before confirmation
    Then the system should cancel the booking process and any selections made should be discarded