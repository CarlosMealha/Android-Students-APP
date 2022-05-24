Feature: Schedule page UI
  Tests regarding the new functionalities added to the schedule page

  Scenario: Edit Events
    Given that I have the "edit" button
    When I tap the "edit" button
    Then I expect the button "conclude edition" to be present
    Then I expect the button "add" to be present

  Scenario: Add Events
    Given that I have the "add" button
    When I tap the "add" button
    Then The button "UC" should be present
    Then The button "ExC" should be present

  #Scenario: Add UC form
   # Given that I have the "UC" button
    #When I tap the "UC" button
    #Then I expect the "subject field" form to be present
    #Then I expect the "type field" form to be present
    #Then I expect the "teacher field" form to be present
    #Then I expect the "start time field" form to be present
    #Then I expect the "end time field" form to be present
    #Then I expect the "day field" form to be present
    #Then I expect the button "cancel" to be present
    #Then I expect the button "accept" to be present

  Scenario: Add UC form
    Given that I have the "UC" button
    When I tap the "UC" button
    Then I expect the four UC information fields to be present
    Then I expect the two UC time information fields to be present
    Then I expect the "accept" and "cancel" buttons to be present

  Scenario: Add ExC form

