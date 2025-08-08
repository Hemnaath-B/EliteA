Feature: Movie Ticket Booking

  This feature allows users to select movies, showtimes, and seats, and complete the booking process with payment and confirmation.

  Scenario: Valid Movie Selection
    Given the user is on the movie selection page
    When the user clicks on a movie title from the list of available movies
    Then the selected movie should be highlighted and the available showtimes for that movie should be displayed

  Scenario: Invalid Movie Selection
    Given the user is on the movie selection page
    When the user tries to select a movie that is not listed
    Then no change in the display should occur and an error message should be shown indicating the selection is invalid

  Scenario: Select Showtime for Movie
    Given the user has selected a movie
    When the user selects a valid showtime from the list of available showtimes for the selected movie
    Then the selected showtime should be highlighted and the available seats for that showtime should be displayed

  Scenario: Invalid Showtime Selection
    Given the user has selected a movie
    When the user tries to select a showtime that is not listed for the selected movie
    Then no change in the display should occur and an error message should be shown indicating the selection is invalid

  Scenario: Valid Seat Selection
    Given the user has selected a movie and a showtime
    When the user selects available seats from the seating chart
    Then the selected seats should be highlighted and the booking summary should be updated accordingly

  Scenario: Invalid Seat Selection
    Given the user has selected a movie and a showtime
    When the user tries to select seats that are already booked or unavailable
    Then an error message should be displayed indicating the seats are unavailable and the user should be prompted to select different seats

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
    When the user tries to proceed to booking without selecting any seats
    Then an error message should be displayed indicating that at least one seat must be selected to proceed

  Scenario: Edge Case - Concurrent Seat Booking
    Given two users are selecting seats for the same movie and showtime
    When both users attempt to book the same seat at the same time
    Then the system should allow the first user to book the seat and display an error message to the second user indicating that the seat is no longer available

  Scenario: Confirmation Email Content
    Given the user has completed the booking process
    When the system sends a confirmation email
    Then the confirmation email should contain the movie name, showtime, selected seats, booking reference number, and any other relevant details

  Scenario: Invalid Email Address
    Given the user is providing an email address during the booking process
    When the user provides an invalid email address
    Then an error message should be displayed indicating that the email address is invalid and the user should be prompted to provide a valid email address

  Scenario: Payment Processing
    Given the user has selected seats and is proceeding to payment
    When the user completes the payment process
    Then the payment should be processed successfully and the booking should be confirmed

  Scenario: Payment Failure
    Given the user has selected seats and is proceeding to payment
    When the user's payment fails due to insufficient funds or other reasons
    Then an error message should be displayed indicating the payment failure and the user should be prompted to retry the payment or use a different payment method

  Scenario: Session Timeout
    Given the user is in the process of booking tickets
    When the user's session times out
    Then the user should be redirected to the login page and any unsaved booking information should be lost