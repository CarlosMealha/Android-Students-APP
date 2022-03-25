

## Requirements

In this section, you should describe all kinds of requirements for your module: functional and non-functional requirements.

### Use case model 

 <p align="center" justify="center">
  <img src="../img/UseCases.png"/>
</p>



### Use cases  

| Name | Add event to calendar |
|--- |--- |
| Actor | Student |
| Description | The student adds an event to the exising calendar |
| Preconditions | Student has access to the *uni* app |
| Postconditions | Student can now see the event in the calendar |
| Normal flow | 1. Student accesses the schedule page of Uni app.<br/> 2. Student presses the edit button.<br/>3. It opens a pop up window <br/> 4. Student selects the add function.<br/>5. Student selects between UC or extracurricular <br/> 6. If the Student selects UC, there is a drop-down box, that allows the Student to select the course name, the classroom, and the time of the class <br/>|
| Alternative flow | 1.[Extracurricular] if in step 5, the Student selects extracurrilar, there is a drop-down box, that allows the Student, write the extracurrilar name, the time, the place, and an adding friend button (to invite the Student_Friend to the extracurricular) <br/> 2. The Student_Friend will receive a notification with the request to attend the extracurricular event<br/> 3. There will be a circle in the Student schedule indicating if the Student_Friend accepter the request (green accepted, red declined, yellow still waiting the answer) |
<br/>

| Name | Remove event from calendar |
|--- |--- |
| Actor | Student |
| Description | The student removes an existing event to the calendar|
| Preconditions | - Student has access to the *uni* app <br/> - A removable event exists in the students' calendar|
| Postconditions | Student can no longer see the event in the calendar |
| Normal flow | |
| Alternative flow | |
<br/>

| Name | Edit event from calendar |
|--- |--- |
| Actor | Student |
| Description | The student edits an event to the exising calendar |
| Preconditions | - Student has access to the *uni* app <br/> - An editable event exists in the students' calendar|
| Postconditions | Student can now see the edited event in the calendar |
| Normal flow | |
| Alternative flow | |
<br/>

| Name | Export calendar to .csv |
|--- |--- |
| Actor | Student |
| Description | The student exports the *uni* calendar to a .csv file |
| Preconditions | Student has access to the *uni* app |
| Postconditions | Student has access to the calendar in a .csv file |
| Normal flow | |
| Alternative flow | |
<br/>

| Name | Import .csv to calendar |
|--- |--- |
| Actor | Student |
| Description | The student imports a .csv file to the *uni* calendar|
| Preconditions | - Student has access to the *uni* app <br/> - Student has a .csv file in the accepted scheme|
| Postconditions | Student can now see the events from the .csv in the calendar |
| Normal flow | |
| Alternative flow | |

### User stories
The user stories should be created as GitHub issues. Therefore, this section will *not* exist in your report, it is here only to explain how you should describe the requirements of the product as **user stories**. 

A user story is a description of desired functionality told from the perspective of the user or customer. A starting template for the description of a user story is 

*As a < user role >, I want < goal > so that < reason >.*

User stories should be created and described as [Issues](https://github.com/LEIC-ES-2021-22/templates/issues) in GitHub with the label "user story". See how to in the video [Creating a Product Backlog of User Stories for Agile Development using GitHub](https://www.youtube.com/watch?v=m8ZxTHSKSKE).

You should name the issue with the text of the user story, and, in the "comments" field, add any relevant notes, the image(s) of the user interface mockup(s) (see below) and the acceptance test scenarios (see below). 

**INVEST in good user stories**. 
You may add more details after, but the shorter and complete, the better. In order to decide if the user story is good, please follow the [INVEST guidelines](https://xp123.com/articles/invest-in-good-stories-and-smart-tasks/).

**User interface mockups**.
After the user story text, you should add a draft of the corresponding user interfaces, a simple mockup or draft, if applicable.

**Acceptance tests**.
For each user story you should write also the acceptance tests (textually in [Gherkin](https://cucumber.io/docs/gherkin/reference/)), i.e., a description of scenarios (situations) that will help to confirm that the system satisfies the requirements addressed by the user story.

**Value and effort**.
At the end, it is good to add a rough indication of the value of the user story to the customers (e.g. [MoSCoW](https://en.wikipedia.org/wiki/MoSCoW_method) method) and the team should add an estimation of the effort to implement it, for example, using t-shirt sizes (XS, S, M, L, XL).



### Domain model

To better understand the context of the software system, it is very useful to have a simple UML class diagram with all the key concepts (names, attributes) and relationships involved of the problem domain addressed by your module. 
Also provide a short textual description of each class. 

Example:
 <p align="center" justify="center">
  <img src="https://github.com/LEIC-ES-2021-22/templates/blob/main/images/DomainModel.png"/>
</p>