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
    When the user tries to select a showtime not listed for the selected movie
    Then no change in the display should occur and an error message should be shown indicating the selection is invalid

  Scenario: Valid Seat Selection
    Given the user has selected a showtime for a movie
    When the user selects available seats
    Then the selected seats should be highlighted and the booking summary should be updated

  Scenario: Invalid Seat Selection
    Given the user has selected a showtime for a movie
    When the user tries to select seats that are already booked
    Then an error message should be displayed indicating the seats are unavailable

  Scenario: Booking Confirmation
    Given the user has completed the seat selection
    When the user proceeds to finalize the booking
    Then the booking should be confirmed on-screen and a confirmation email should be sent to the user's email address

  Scenario: Edge Case - Maximum Seat Selection
    Given the user is selecting seats for a movie
    When the user selects the maximum allowable number of seats
    Then the system should allow the selection and update the booking summary accordingly

  Scenario: Edge Case - No Seats Selected
    Given the user is on the seat selection page
    When the user tries to proceed to booking without selecting any seats
    Then an error message should be displayed indicating that at least one seat must be selected

  Scenario: Edge Case - Booking History
    Given the user is logged into their account
    When the user navigates to the booking history section
    Then the user's past bookings should be displayed, including movie titles, showtimes, and seat selections

  Scenario: Edge Case - Double Booking Prevention
    Given two users are trying to book the same seats simultaneously
    When the first user completes the booking
    Then the system should allow the first booking and prevent the second user from booking the same seats, displaying an error message to the second user

  Scenario: Edge Case - System Load Handling
    Given multiple users are booking tickets simultaneously
    When the system experiences high load conditions
    Then the system should handle the load gracefully without crashing, and bookings should be processed correctly

  Scenario: Negative Case - Invalid Email Format
    Given the user is on the booking confirmation page
    When the user enters an invalid email format
    Then an error message should be displayed indicating that the email format is invalid

  Scenario: Negative Case - Payment Failure
    Given the user is on the payment page
    When the user's payment is declined
    Then an error message should be displayed indicating the payment failure, and the booking should not be confirmed

  Scenario: Positive Case - Successful Payment
    Given the user is on the payment page
    When the user's payment is accepted
    Then the booking should be confirmed on-screen and a confirmation email should be sent to the user's email address