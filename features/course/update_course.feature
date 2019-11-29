#enconding: utf-8
@access_site @course
Feature: Update Course

    To validate the update a course
    As a teacher in Schoology
    I want to update assignments for the students
    
    @severity_blocker
    Scenario: Edit Course
        When I access My Course
        And I want to update a Course
        And I change some information
        Then I should see the following message "The section has been updated."
        And the course will be updated
    
    @severity_critical
    Scenario Outline: Edit Course without required fields
        When I access My Course
        And I want to update a Course
        But I remove the information in the <upd_fields>
        Then I should see alert <message>

        Examples:
            | upd_fields      | message                           |
            | "name"          | "Course Name field is required."  |
            | "section"       | "Section Name field is required." |
            | "subject_area " | "Subject Area field is required." |
            | "level"         | "Level field is required."        |