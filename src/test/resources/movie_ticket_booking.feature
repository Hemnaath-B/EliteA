Feature: Movie ticket booking
  This feature allows users to book movie tickets by selecting movies, showtimes, seats, and completing the booking process.

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

Scenario: Select Seats
  Given the user has selected a showtime for a movie
  When the user selects available seats
  Then the selected seats should be highlighted and the booking summary should be updated

Scenario: Select Occupied Seats
  Given the user has selected a showtime for a movie
  When the user tries to select seats that are already booked
  Then an error message should be displayed indicating the seats are not available

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
  When the user selects one seat
  Then the system should allow the selection and update the booking summary accordingly

Scenario: Edge Case - No Seat Selection
  Given the user is selecting seats for a movie
  When the user tries to proceed without selecting any seats
  Then an error message should be displayed indicating that at least one seat must be selected

Scenario: Invalid Email Address
  Given the user is on the booking confirmation page
  When the user enters an invalid email address format
  Then an error message should be displayed indicating the email address is invalid

Scenario: System Timeout
  Given the user is in the process of booking tickets
  When the user takes too long to complete the booking process
  Then the system should log the user out and display a timeout message, requiring the user to start the booking process again

Scenario: Payment Processing
  Given the user is on the payment page
  When the user enters valid payment details and proceeds with the payment
  Then the payment should be processed successfully and a booking confirmation should be displayed and emailed to the user

Scenario: Payment Failure
  Given the user is on the payment page
  When the user enters invalid payment details or the payment is declined
  Then an error message should be displayed indicating the payment failed and the user should be prompted to retry with valid payment details

Scenario: Booking History
  Given the user is on their account page
  When the user navigates to the booking history section
  Then the user's past bookings should be displayed with details such as movie title, showtime, seats, and booking date

Scenario: Cancel Booking
  Given the user is on their booking history page
  When the user selects a booking to cancel
  Then the booking should be canceled and the user should receive a cancellation confirmation