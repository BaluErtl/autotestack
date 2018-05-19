Feature: search wikipedia
  In order to learn about BDD
  As a passionate developers
  I need to be able to search a general internet site

  Scenario: Search for BDD string
    Given I am in wikipedia
    When I search for "Behavior driven development"
#      TODO: write pending definition
    Then the first heading should be "Behavior-driven development"
