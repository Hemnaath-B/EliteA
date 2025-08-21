Feature: User Registration

Scenario: Successful registration with valid inputs
  Given the user is on the registration page
  When the user enters "John" as First Name, "Doe" as Last Name, "john.doe@example.com" as Email, "Password123!" as Password, and "Password123!" as Confirm Password
  Then the user is registered successfully
  And the user receives a confirmation email
  And the user can log in using the registered email and password

Scenario: Confirmation email is sent upon successful registration
  Given the user is on the registration page
  When the user enters "Jane" as First Name, "Smith" as Last Name, "jane.smith@example.com" as Email, "SecurePass456!" as Password, and "SecurePass456!" as Confirm Password
  Then the user receives a confirmation email at "jane.smith@example.com"

Scenario: User can log in after successful registration
  Given the user is registered with "Alice" as First Name, "Johnson" as Last Name, "alice.johnson@example.com" as Email, "AlicePass789!" as Password, and "AlicePass789!" as Confirm Password
  When the user attempts to log in with "alice.johnson@example.com" as Email and "AlicePass789!" as Password
  Then the user is able to log in successfully

Scenario: Registration fails with missing required fields
  Given the user is on the registration page
  When the user enters "" as First Name, "Doe" as Last Name, "john.doe@example.com" as Email, "Password123!" as Password, and "Password123!" as Confirm Password
  Then the registration fails with an error message indicating the First Name field is required

Scenario: Registration fails with invalid email format
  Given the user is on the registration page
  When the user enters "John" as First Name, "Doe" as Last Name, "john.doe@com" as Email, "Password123!" as Password, and "Password123!" as Confirm Password
  Then the registration fails with an error message indicating the Email field is invalid

Scenario: Registration fails when passwords do not match
  Given the user is on the registration page
  When the user enters "John" as First Name, "Doe" as Last Name, "john.doe@example.com" as Email, "Password123!" as Password, and "Password456!" as Confirm Password
  Then the registration fails with an error message indicating the passwords do not match

Scenario: Registration fails with a weak password
  Given the user is on the registration page
  When the user enters "John" as First Name, "Doe" as Last Name, "john.doe@example.com" as Email, "123" as Password, and "123" as Confirm Password
  Then the registration fails with an error message indicating the password is too weak

Scenario: Registration fails with an already registered email
  Given the user is on the registration page
  When the user enters "John" as First Name, "Doe" as Last Name, "existing.user@example.com" as Email, "Password123!" as Password, and "Password123!" as Confirm Password
  Then the registration fails with an error message indicating the email is already registered

Scenario: Registration with maximum length inputs
  Given the user is on the registration page
  When the user enters "A" * 50 as First Name, "B" * 50 as Last Name, "long.email.address@example.com" as Email, "LongPassword1234567890!" as Password, and "LongPassword1234567890!" as Confirm Password
  Then the user is registered successfully
  And the user receives a confirmation email
  And the user can log in using the registered email and password

Scenario: Registration with minimum length inputs
  Given the user is on the registration page
  When the user enters "A" as First Name, "B" as Last Name, "a@b.com" as Email, "Pass1!" as Password, and "Pass1!" as Confirm Password
  Then the user is registered successfully
  And the user receives a confirmation email
  And the user can log in using the registered email and password

Scenario: Registration fails with special characters in name fields
  Given the user is on the registration page
  When the user enters "John@" as First Name, "Doe#" as Last Name, "john.doe@example.com" as Email, "Password123!" as Password, and "Password123!" as Confirm Password
  Then the registration fails with an error message indicating invalid characters in the name fields