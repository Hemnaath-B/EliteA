Feature: Movie ticket booking
  This feature allows users to book movie tickets by selecting movies, showtimes, and seats, and completing the booking process.

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
    When the user tries to select a showtime that is not available
    Then no change in the display should occur and an error message should be shown indicating the selection is invalid

  Scenario: Valid Seat Selection
    Given the user has selected a showtime for the movie
    When the user selects available seats
    Then the selected seats should be highlighted and the booking summary should be updated

  Scenario: Invalid Seat Selection
    Given the user has selected a showtime for the movie
    When the user tries to select seats that are already booked or unavailable
    Then an error message should be shown indicating the seats are unavailable and the user should be prompted to select different seats

  Scenario: Booking Confirmation
    Given the user has completed the seat selection
    When the user proceeds to finalize the booking
    Then the booking should be confirmed on-screen and a confirmation email should be sent to the user's email address

  Scenario: Edge Case - Maximum Seat Selection
    Given the user is selecting seats for a movie
    When the user selects the maximum allowable number of seats
    Then the system should allow the selection and update the booking summary accordingly

  Scenario: Edge Case - Minimum Seat Selection
    Given the user is selecting seats for a movie
    When the user selects only one seat
    Then the system should allow the selection and update the booking summary accordingly

  Scenario: Edge Case - No Seat Selection
    Given the user has selected a showtime for the movie
    When the user proceeds to booking without selecting any seats
    Then an error message should be shown indicating that at least one seat must be selected before proceeding

  Scenario: Edge Case - Session Timeout
    Given the user is in the process of booking tickets
    When the session times out due to inactivity
    Then the system should log the user out and display a session timeout message, prompting the user to log in again

  Scenario: Email Confirmation Format
    Given the user has completed a booking
    When the confirmation email is sent
    Then the email should contain the correct movie title, showtime, seat numbers, and booking reference number

  Scenario: Invalid Email Address
    Given the user is entering their email address during the booking process
    When the user enters an invalid email address
    Then an error message should be shown indicating the email address is invalid and the user should be prompted to enter a valid email address

  Scenario: Payment Processing
    Given the user has selected seats and is ready to proceed to payment
    When the user initiates the payment process
    Then the system should process the payment and confirm the booking

  Scenario: Payment Failure
    Given the user has selected seats and is ready to proceed to payment
    When the user's payment is declined
    Then an error message should be shown indicating the payment failure and the user should be prompted to try again or use a different payment method

  Scenario: Booking History
    Given the user is logged into their account
    When the user navigates to the booking history section
    Then the user should be able to view their past bookings