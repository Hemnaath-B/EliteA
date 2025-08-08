Feature: Movie Booking
  This feature allows users to select movies, showtimes, and seats, and complete the booking process.

  Scenario: Valid Movie Selection
    Given the user is logged in and on the movie selection page
    When the user clicks on the title of an available movie
    Then the selected movie should be highlighted and the available showtimes should be displayed

  Scenario: Invalid Movie Selection
    Given the user is logged in and on the movie selection page
    When the user tries to select a movie not listed
    Then no change in the display should occur and an error message should be shown indicating the selection is invalid

  Scenario: Select Showtime for Movie
    Given the user has selected a valid movie
    When the user selects a valid showtime for the movie
    Then the selected showtime should be highlighted and available seats should be displayed

  Scenario: Invalid Showtime Selection
    Given the user has selected a valid movie
    When the user tries to select a showtime not listed
    Then no change in the display should occur and an error message should be shown indicating the selection is invalid

  Scenario: Select Preferred Seats
    Given the user has selected a valid movie and showtime
    When the user selects available seats
    Then the selected seats should be highlighted and the booking summary should be updated

  Scenario: Invalid Seat Selection
    Given the user has selected a valid movie and showtime
    When the user tries to select seats that are already booked or unavailable
    Then no change in the display should occur and an error message should be shown indicating the selection is invalid

  Scenario: Booking Confirmation
    Given the user has selected a valid movie, showtime, and seats
    When the user completes the seat selection and proceeds to finalize the booking
    Then the booking should be confirmed on-screen and a confirmation email should be sent to the user's email address

  Scenario: Edge Case - Maximum Seat Selection
    Given the user has selected a valid movie and showtime
    When the user selects the maximum allowable number of seats
    Then the system should allow the selection and update the booking summary accordingly

  Scenario: Edge Case - No Seats Selected
    Given the user has selected a valid movie and showtime
    When the user tries to proceed to booking without selecting any seats
    Then the system should display an error message indicating that at least one seat must be selected

  Scenario: Edge Case - Booking Timeout
    Given the user has selected a valid movie, showtime, and seats
    When the user takes too long to complete the booking process
    Then the system should display a timeout message and redirect the user to the movie selection page

  Scenario: Edge Case - Invalid Email Address
    Given the user has selected a valid movie, showtime, and seats
    When the user enters an invalid email address and proceeds to booking
    Then the system should display an error message indicating that a valid email address must be provided

  Scenario: Edge Case - Network Failure During Booking
    Given the user has selected a valid movie, showtime, and seats
    When a network failure occurs during the booking process
    Then the system should display a network error message and prompt the user to retry the booking process