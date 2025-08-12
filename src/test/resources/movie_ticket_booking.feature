Feature: Movie Ticket Booking
  This feature allows users to select movies, showtimes, and seats, and to finalize their booking.

  Scenario: Valid Movie Selection
    Given the user is on the movie selection page
    When the user clicks on the title of the movie "Coolie"
    Then the selected movie "Coolie" should be highlighted and the available showtimes should be displayed

  Scenario: Invalid Movie Selection
    Given the user is on the movie selection page
    When the user tries to select a movie not listed
    Then no change in the display should occur and an error message should be shown indicating the selection is invalid

  Scenario: Valid Showtime Selection
    Given the user has selected the movie "Coolie"
    When the user selects the showtime "Saturday 9 am" for the movie "Coolie"
    Then the selected showtime "Saturday 9 am" should be highlighted and available seats should be displayed

  Scenario: Invalid Showtime Selection
    Given the user has selected the movie "Coolie"
    When the user tries to select a showtime not available for "Coolie"
    Then no change in the display should occur and an error message should be shown indicating the selection is invalid

  Scenario: Valid Seat Selection
    Given the user has selected the showtime "Saturday 9 am" for the movie "Coolie"
    When the user selects 3 available seats for the chosen showtime
    Then the selected seats should be highlighted and the booking summary should be updated accordingly

  Scenario: Invalid Seat Selection
    Given the user has selected the showtime "Saturday 9 am" for the movie "Coolie"
    When the user tries to select more than the available seats
    Then an error message should be shown indicating the selection is invalid and the user should be prompted to select a valid number of seats

  Scenario: Booking Confirmation
    Given the user has completed the seat selection for the movie "Coolie"
    When the user proceeds to finalize the booking
    Then the booking should be confirmed on-screen and a confirmation email should be sent to the user's email address

  Scenario: Edge Case - Maximum Seat Selection
    Given the user is selecting seats for the movie "Coolie"
    When the user selects the maximum allowable number of seats
    Then the system should allow the selection and update the booking summary accordingly

  Scenario: Edge Case - Minimum Seat Selection
    Given the user is selecting seats for the movie "Coolie"
    When the user selects the minimum number of seats
    Then the system should allow the selection and update the booking summary accordingly

  Scenario: Edge Case - Booking Without Seat Selection
    Given the user has selected the showtime "Saturday 9 am" for the movie "Coolie"
    When the user tries to proceed to booking without selecting any seats
    Then an error message should be shown indicating that seat selection is required before proceeding to booking

  Scenario: Edge Case - Booking with Invalid Email
    Given the user has completed the seat selection for the movie "Coolie"
    When the user enters an invalid email address during the booking process
    Then an error message should be shown indicating that a valid email address is required for booking confirmation

  Scenario: Edge Case - Booking with Network Interruption
    Given the user has completed the seat selection for the movie "Coolie"
    When the user proceeds to booking and a network interruption occurs
    Then the system should display an error message indicating a network issue and prompt the user to retry the booking process