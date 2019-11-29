#enconding: utf-8
@login
Feature: Login Site
    As a Teacher
    In order to use the application
    I want to login with email and password

    Background: Schoology page
        Given I am at the Login Schoology page

    @severity_blocker
    Scenario Outline: Logging with valid credentials
        When I fill login with <user>
        Then I should be autenticated
        And I should see my user on my homepage

        Examples:
            | user |
            | "qa" |

    @severity_critical
    Scenario Outline: Logging with invalid credentials
        When I fill login with <user>
        Then I should see the <message> alert

        Examples:
            | user       | message                                                                                                                   |
            | "failuser" | "Error: The email address and password combination you entered cannot be recognized or does not exist. Please try again." |