#enconding: utf-8
@csv
Feature: Convert File

    To validate convert files function
    As a QA
    I want to verify converted file

    Scenario: JSON to CSV
        When I have a JSON file
        And I want to convert from JSON into CSV
        Then I should see my file saved as CSV