Feature: Schedule page UI
  Tests regarding the new functionalities added to the schedule page

  Scenario: Edit Events
    Given I navigate to the "schedule" page
    When I tap the "edit" button
    Then I expect the button "conclude edition" to be present
    And I expect the button "add" to be present