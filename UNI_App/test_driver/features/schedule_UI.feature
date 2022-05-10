Feature: Schedule page UI
  Tests regarding the new functionalities added to the schedule page

  Scenario: Edit Events
    Given that I have the "edit" button
    When I tap the "edit" button
    Then I expect the button "conclude edition" to be present
    Then I expect the button "add" to be present