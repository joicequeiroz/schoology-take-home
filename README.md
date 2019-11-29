# Schoology - QA - Take Home
## Task 1 - Test Case Writing Activity
### Test Cases 
Feature: Copying Material - Many Schools

    To validate the copying material from one course to another course
    As a Schoology Administrator with many schools 
    I want to look at my list of courses

    @severity_blocker
    Scenario: Copying an existing material
        When I access My Course
        And I want to copy a material
        And I choose the option Copy to Course 
        And I see their associated school
        Then I should see the Copy to Other Courses page
        And select the material I would like a copy
        Then I should see the course copying
    
    @severity_minor
    Scenario: Copying an existing material and cancel
        When I access My Course
        And I want to copy a material
        And I choose the option Copy to Course 
        And I see their associated school
        Then I should see the Copy to Other Courses page
        And select the material I would like a copy
        But I cancel the action
        Then I should not see the course copying
    
    @severity_blocker
    Scenario: Adding a new material
        When I access My Course
        And I want to add a new material
        And I choose the option Create
        And I fill the course with valid_data
        Then I should see my new course created

    @severity_critical
    Scenario Outline: Adding a new material, without required fields
        When I access My Course
        And I want to add a new material
        And I choose the option Create
        But I do not fill the <fields>
        Then I should see alert <message>

        Examples:
            | fields          | message                           |
            | "name"          | "Course Name field is required."  |
            | "section"       | "Section Name field is required." |
            | "subject_area " | "Subject Area field is required." |
            | "level"         | "Level field is required."        |


## Task 2 - Test Methodology and Planning Activity
### Test Cases 
Test cases focused on user stories:
1. The teacher to enter a custom grade as an overall grade;
2. The teacher to enter a custom grade but not confirm;
3. The teacher do not have access on gradebook;
4. The teacher to update an overall for a specific student;
5. The teacher to update an overall more than 2 student;
6. The teacher to delete an overall for a specific student;
7. The teacher to delete an overall more than 2 student;

Test cases focused on Business requirement:
1. Teacher in a large district to manually enter a grade into an overall grade period;
2. Teacher in a large district to manually edit a grade into an overall grade period;
3. Teacher in a large district to manually delete a grade into an overall grade period;

Test cases focused on Taxonomy:
1. Enter a grade override;
2. Edit a grade override;
3. Delete a grade override;

Test cases focused on Background information:
1. Validate icons;
2. Validate colors standard;
3. Validate size standard;
4. Validate multi browers;

To be planning:
1. Enhancing the Gradebook interface
2. More flexibility with how grades can be entered and calculated
3. No limitations are created by technology.(In a paper grade book, grades can be edited, added, reviewed at any time)
4. Grades can be entered on a smartphone

## Technical Take Home
### Exercise 1 

### Step 1:
Install:

* Ruby 2.5.5 and DevKit (https://rubyinstaller.org/downloads/)
* Bundler ($ gem install bundler);

### Step 2:
Clone project: 

    * $ git clone https://github.com/joicequeiroz/schoology-take-home.git

### Step 3:
After to clone project, go to the project root and execute $ bundle install

### Running automated test cases
#### Run all test cases
<blockquote>$ cucumber</blockquote>

#### Run tests for a specific functionality
Login
    <blockquote>$ cucumber --tag @login</blockquote>

Course
    <blockquote>$ cucumber --tag @course</blockquote>

#### Run tests cases with blocker severity
```text
$ cucumber --tag @severity_blocker
```
#### After tests are run, results are stored in ..\ log \ report.html

### 2. Exercise 2
For this exercise, I defined two solution:

In the first, I used the gem json2csv, it is simple tool for converting JSON to CSV
Run the following comand:
    * $ json2csv convert fixtures/input_data.json

The input_data.csv will be created in the same file.

In the second, I implement a scenario, for run this test
 CSV
    <blockquote>$ cucumber --tag @csv</blockquote>

## Technical Activity
Using the IDE of your choice, program an automated test that retrieves $20 from an ATM

import static com.kms.katalon.core.checkpoint.CheckpointFactory.findCheckpoint
import static com.kms.katalon.core.testcase.TestCaseFactory.findTestCase
import static com.kms.katalon.core.testdata.TestDataFactory.findTestData
import static com.kms.katalon.core.testobject.ObjectRepository.findTestObject
import com.kms.katalon.core.checkpoint.Checkpoint as Checkpoint
import com.kms.katalon.core.checkpoint.CheckpointFactory as CheckpointFactory
import com.kms.katalon.core.mobile.keyword.MobileBuiltInKeywords as MobileBuiltInKeywords
import com.kms.katalon.core.model.FailureHandling as FailureHandling
import com.kms.katalon.core.testcase.TestCase as TestCase
import com.kms.katalon.core.testcase.TestCaseFactory as TestCaseFactory
import com.kms.katalon.core.testdata.TestData as TestData
import com.kms.katalon.core.testdata.TestDataFactory as TestDataFactory
import com.kms.katalon.core.testobject.ObjectRepository as ObjectRepository
import com.kms.katalon.core.testobject.TestObject as TestObject
import com.kms.katalon.core.webservice.keyword.WSBuiltInKeywords as WSBuiltInKeywords
import com.kms.katalon.core.webui.driver.DriverFactory as DriverFactory
import com.kms.katalon.core.webui.keyword.WebUiBuiltInKeywords as WebUiBuiltInKeywords
import internal.GlobalVariable as GlobalVariable
import com.kms.katalon.core.webui.keyword.WebUiBuiltInKeywords as WebUI
import com.kms.katalon.core.mobile.keyword.MobileBuiltInKeywords as Mobile
import com.kms.katalon.core.webservice.keyword.WSBuiltInKeywords as WS

import com.thoughtworks.selenium.Selenium
import org.openqa.selenium.firefox.FirefoxDriver
import org.openqa.selenium.WebDriver
import com.thoughtworks.selenium.webdriven.WebDriverBackedSelenium
import static org.junit.Assert.*
import java.util.regex.Pattern
import static org.apache.commons.lang3.StringUtils.join

WebUI.openBrowser('https://www.katalon.com/')
def driver = DriverFactory.getWebDriver()
String baseUrl = "https://www.katalon.com/"
selenium = new WebDriverBackedSelenium(driver, baseUrl)
selenium.open("http://www.motc.gov.qa/en/ditoolkit/migrant-workers/cash-machine-simulator-atm")
selenium.selectFrame("index=0")
selenium.click("id=Stage_ATM_BankCardButton_BankCard")
selenium.click("id=Stage_ATM_SelectLanguage_button_english_Rectangle")
selenium.click("id=Stage_ATM_EnterPin_enterPin_hit_0_Rectangle")
selenium.click("id=Stage_ATM_EnterPin_enterPin_hit_6_Rectangle")
selenium.click("id=Stage_ATM_EnterPin_enterPin_hit_2_Rectangle")
selenium.click("id=Stage_ATM_EnterPin_enterPin_hit_3_Rectangle")
selenium.click("id=Stage_ATM_EnterPin_enterPin_hitEnter_Rectangle")
selenium.click("id=Stage_ATM_ChooseAccountType_button_current_Rectangle")
selenium.click("id=Stage_ATM_ATMMenu_menuButton_changePIN_Rectangle")
selenium.click("id=Stage_ATM_ATMMenu_menuButton_cash_Rectangle")
selenium.click("id=Stage_ATM_CashMenu_menuButton_50_Rectangle")
selenium.click("id=Stage_ATM_TakeCash_cashHit_Rectangle")
selenium.click("id=Stage_ATM_AnotherService_button_no_Rectangle")
selenium.click("id=Stage_ATM_TakeCard_cardHit_Rectangle")

## Questions
1. Is it possible to create the course with the same name as the other already exists?
2. Is it possible to delete batch courses?
3. When I remove a course/section, the system put the course in inactive status. However, the text of the message is, "Are you sure you want to delete Section 1?" and, when I delete an inactive course, the system has shown the following message "Are you sure you want to delete <name_of_course>?". How is the difference between them?

### Bugs found
Test Case | Expected Results | Actual Results | Severity
--- | --- | --- | ---
Edit Course | When I edit a course, update a field, and click in the button "Save", the system has shown the following message: "The section has been updated.". And then, I click on the button "Cancel", the system will returne to Materials page. | When I click on the button "Cancel", the system remove the message "The section has been updated." on the top of the page, and not returned to Materials page.| Critical | 
Edit Course without required fields - name | When I edit a course, delete a data of name, and click in the button "Save" the system has shown the following message: "The section has been updated.". However, the field edit it was "name" and this field is required. | When I click on the button "Save", the system has shown the following message :"Course Name field is required." and, the course is not updated.| Critical | 
