Feature: Movie ticket booking
  This feature allows users to select movies, showtimes, and seats, and complete the booking process with various edge cases handled.

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

Scenario: Valid Seat Selection
  Given the user has selected a movie and showtime
  When the user selects available seats
  Then the selected seats should be highlighted and the seat selection should be updated in the booking summary

Scenario: Invalid Seat Selection
  Given the user has selected a movie and showtime
  When the user tries to select seats that are already booked or unavailable
  Then an error message should be displayed indicating the seats are unavailable and the seat selection should remain unchanged

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
  Given the user has selected a movie and showtime
  When the user tries to proceed to booking without selecting any seats
  Then an error message should be displayed indicating that at least one seat must be selected

Scenario: Edge Case - Booking Multiple Movies
  Given the user is on the movie selection page
  When the user selects multiple movies and showtimes
  Then the system should allow the selection and update the booking summary for each movie and showtime

Scenario: Edge Case - Session Timeout
  Given the user is in the process of booking tickets
  When the user remains inactive for a period longer than the session timeout duration
  Then the user should be logged out, any selections should be cleared, and the user should be prompted to log in again

Scenario: Edge Case - Invalid Payment Information
  Given the user is on the payment page
  When the user enters invalid payment details (e.g., expired credit card)
  Then an error message should be displayed indicating the payment information is invalid and the booking should not be completed

Scenario: Edge Case - Successful Payment
  Given the user is on the payment page
  When the user enters valid payment details
  Then the payment should be processed successfully, the booking should be confirmed on-screen, and a confirmation email should be sent to the user's email address

Scenario: Edge Case - Booking Cancellation
  Given the user has selected seats but has not completed the payment
  When the user cancels the booking
  Then the booking should be canceled and the selected seats should be released

Scenario: Edge Case - Booking Modification
  Given the user has an existing booking
  When the user modifies the booking
  Then the system should allow the modification and update the booking summary accordingly