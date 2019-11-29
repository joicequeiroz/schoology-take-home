#enconding: utf-8
@access_site @course
Feature: Create Course

    To validate the create a course
    As a teacher in Schoology
    I want to add assignments for the students

    @severity_blocker
    Scenario: New Course
        When I access My Course
        And I want to create Course
        And I fill the course with valid_data
        Then I should see my new course created

    @severity_critical
    Scenario Outline: New Course without required fields
        When I access My Course
        And I want to create Course
        But I do not fill the <fields>
        Then I should see alert <message>

        Examples:
            | fields          | message                           |
            | "name"          | "Course Name field is required."  |
            | "section"       | "Section Name field is required." |
            | "subject_area " | "Subject Area field is required." |
            | "level"         | "Level field is required."        |