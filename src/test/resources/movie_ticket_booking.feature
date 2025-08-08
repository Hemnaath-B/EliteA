Feature: Movie ticket booking

  This feature allows users to book movie tickets by selecting movies, showtimes, and seats, and finalizing the booking with payment and contact details.

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
    When the user tries to select a showtime not listed
    Then no change in the display should occur and an error message should be shown indicating the selection is invalid

  Scenario: Seat Selection
    Given the user has selected a showtime for a movie
    When the user selects one or more available seats
    Then the selected seats should be highlighted and the booking summary should be updated to reflect the selected seats

  Scenario: Invalid Seat Selection
    Given the user has selected a showtime for a movie
    When the user tries to select seats that are already booked or unavailable
    Then an error message should be displayed indicating that the selected seats are unavailable

  Scenario: Booking Confirmation
    Given the user has completed the seat selection
    When the user proceeds to finalize the booking by providing necessary details (e.g., payment information)
    Then the booking should be confirmed on-screen and a confirmation email should be sent to the user's email address

  Scenario: Edge Case - Maximum Seat Selection
    Given the user is selecting seats for a movie
    When the user selects the maximum allowable number of seats
    Then the system should allow the selection and update the booking summary accordingly

  Scenario: Edge Case - No Seats Selected
    Given the user has selected a showtime for a movie
    When the user tries to proceed to booking without selecting any seats
    Then an error message should be displayed indicating that at least one seat must be selected

  Scenario: Edge Case - Booking Timeout
    Given the user is in the process of booking tickets
    When the user takes too long to complete the booking process
    Then the system should cancel the booking process and release the selected seats, displaying a timeout message to the user

  Scenario: Edge Case - Invalid Email Address
    Given the user is finalizing the booking
    When the user provides an invalid email address (e.g., missing "@" or domain)
    Then an error message should be displayed indicating that a valid email address must be provided

  Scenario: Edge Case - Payment Failure
    Given the user is finalizing the booking
    When the user provides invalid payment details or the payment is declined
    Then an error message should be displayed indicating that the payment failed, and the user should be prompted to retry with valid payment details

  Scenario: Edge Case - Duplicate Booking
    Given the user has selected seats for a showtime
    When the user attempts to book the same seats for the same showtime in quick succession
    Then the system should prevent duplicate bookings and display a message indicating that the seats are already booked

  Scenario: Edge Case - System Crash During Booking
    Given the user is in the process of booking tickets
    When the system crashes during the booking process
    Then the system should recover and restore the user's previous selections, allowing the user to continue from where they left off