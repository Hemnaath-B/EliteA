Feature: Movie ticket booking
  This feature allows users to book movie tickets by selecting movies, showtimes, and seats.

  Scenario: Valid Movie Selection
    Given the user is logged in and on the movie selection page
    When the user clicks on a valid movie title
    Then the selected movie should be highlighted and the available showtimes should be displayed

  Scenario: Invalid Movie Selection
    Given the user is logged in and on the movie selection page
    When the user tries to select a movie not listed
    Then no change in the display should occur and an error message should be shown indicating the selection is invalid

  Scenario: Select Showtime for Movie
    Given the user has selected a valid movie
    When the user selects a valid showtime
    Then the selected showtime should be highlighted and available seats should be displayed

  Scenario: Invalid Showtime Selection
    Given the user has selected a valid movie
    When the user tries to select a showtime not listed
    Then no change in the display should occur and an error message should be shown indicating the selection is invalid

  Scenario: Valid Seat Selection
    Given the user has selected a valid movie and showtime
    When the user selects available seats
    Then the selected seats should be highlighted and the booking summary should be updated

  Scenario: Invalid Seat Selection
    Given the user has selected a valid movie and showtime
    When the user tries to select seats that are already booked or not available
    Then an error message should be displayed indicating the seats are not available

  Scenario: Booking Confirmation
    Given the user has selected a valid movie, showtime, and seats
    When the user completes the seat selection and proceeds to booking
    Then the booking should be confirmed on-screen and a confirmation email should be sent to the user's email address

  Scenario: Edge Case - Maximum Seat Selection
    Given the user has selected a valid movie and showtime
    When the user selects the maximum allowable number of seats
    Then the system should allow the selection and update the booking summary accordingly

  Scenario: Edge Case - Minimum Seat Selection
    Given the user has selected a valid movie and showtime
    When the user selects only one seat
    Then the system should allow the selection and update the booking summary accordingly

  Scenario: Edge Case - No Seat Selection
    Given the user has selected a valid movie and showtime
    When the user tries to proceed to booking without selecting any seats
    Then an error message should be displayed indicating that at least one seat must be selected

  Scenario: Email Confirmation Content
    Given the user has completed a booking
    When the user checks the received confirmation email
    Then the email should contain the movie name, showtime, seat numbers, booking reference number, and user details

  Scenario: System Performance Under Load
    Given multiple users are logged in and booking tickets simultaneously
    When multiple users select movies, showtimes, and seats simultaneously
    Then the system should handle the load without crashing or significant performance degradation

  Scenario: Session Timeout
    Given the user is logged in and on the movie selection page
    When the user's session times out
    Then the user should be redirected to the login page and any unsaved selections should be discarded