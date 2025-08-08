Feature: Movie ticket booking
  This feature allows users to select movies, showtimes, seats, and complete the booking process with various validations and edge case handling.

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
  When the user tries to select a showtime that is not listed
  Then no change in the display should occur and an error message should be shown indicating the selection is invalid

Scenario: Seat Selection
  Given the user has selected a showtime for the movie
  When the user selects available seats from the seating chart
  Then the selected seats should be highlighted and the total price should be updated accordingly

Scenario: Invalid Seat Selection
  Given the user has selected a showtime for the movie
  When the user tries to select seats that are already booked or not available
  Then an error message should be displayed indicating the seats are not available and the user should be prompted to select different seats

Scenario: Booking Confirmation
  Given the user has completed the seat selection
  When the user proceeds to finalize the booking
  Then the booking should be confirmed on-screen and a confirmation email should be sent to the user's email address

Scenario: Edge Case - Maximum Seat Selection
  Given the user is selecting seats for a movie
  When the user selects the maximum allowable number of seats
  Then the system should allow the selection and update the booking summary accordingly

Scenario: Edge Case - No Seats Selected
  Given the user has selected a showtime for the movie
  When the user tries to proceed to booking without selecting any seats
  Then an error message should be displayed indicating that at least one seat must be selected to proceed

Scenario: Edge Case - Booking Timeout
  Given the user has selected seats for a movie
  When the user waits beyond the allowed time limit before confirming the booking
  Then the system should release the selected seats and prompt the user to start the selection process again

Scenario: Edge Case - Invalid Email Address
  Given the user is on the booking confirmation page
  When the user provides an invalid email address format
  Then an error message should be displayed indicating that a valid email address must be provided

Scenario: Edge Case - Payment Failure
  Given the user has completed the seat selection and proceeded to payment
  When the payment process fails
  Then an error message should be displayed indicating the payment failure and the user should be prompted to retry the payment or select a different payment method

Scenario: Edge Case - Duplicate Booking
  Given the user has completed the seat selection for a showtime
  When the user tries to book the same seats for the same showtime multiple times
  Then the system should prevent duplicate bookings and display an error message indicating that the seats are already booked

Scenario: Edge Case - System Load
  Given the user is booking seats for a movie during peak hours
  When the system experiences high load
  Then the system should still respond appropriately and maintain performance without crashing or significantly slowing down