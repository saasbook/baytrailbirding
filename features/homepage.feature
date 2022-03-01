Feature: Homepage Layout
  As a product manager
  I want users to see the fully loaded homepage
  So that they are able to use the app succesfully

  Scenario: User sees all elements of the homepage.
    When I go to the homepage
    Then I should see the organization name
    Then I should see the side navigation bar
    Then I should see the map placeholder
    Then I should see the map items
    Then I should see the html class "container-fluid"
    Then I should see the html class "col-md-8"
    Then I should see the image "/assets/sfbbo-logo-5489f311ac5af128f58c30e58378a9644b52c8a9299b4506f9b3ab75f28069a0.jpg"

  Scenario: User sees all show all pages.
    When I go to the homepage
    Then I go to the locations page
    Then I should see location cards

  Scenario: User sees all show all pages.
    When I go to the homepage
    Then I go to the locations page
    Then I should see location cards
