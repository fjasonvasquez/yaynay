Feature: Users can learn how good something is

  @compare-two-terms
  Scenario: Compare two terms
    When I search for microsoft
    And I search for the apple
    Then the beatles should have a higher score than microsoft

  Scenario: Why are the results for microsoft and apple so close? 
    When pending

