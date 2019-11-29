#enconding: utf-8
@access_site @course
Feature: Delete Course

    To validate the delete a course
    As a teacher in Schoology
    I want to delete assignments for the students
    
    @severity_blocker
    Scenario: Delete Course
        When I access My Course
        And I want to delete a Course
        And I confirm to delete the Course
        Then I should see my the following message "Section Section 1 has been deleted."
        And the course is inactive
    
    @severity_critical
    Scenario: Delete course after inactivating
        When I access My Course
        And I want to delete a Course inactive
        And I confirm to delete the inative Course
        Then the course will be completely removed