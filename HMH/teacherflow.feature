@flightNewLogin @New-code @teacherWorkFlow @teacherAssessments @teacherDashboard

Feature: Login

Flight Login

    Scenario: Teacher login to Flight and assign requited assessments to Students. 
        Given The user enters the login URL
        Then The user selects the "United States" from the Country input
        And The user selects the "Other" state from the State input
        And The user selects the "unitedStates" org for "newLoginTests" tests
        And The user presses the "Next" button
        Given The user enters the login URL
        Then The user should be redirected back to login
        And The user logs into the "unitedStates" org for "newLoginTests" tests
        Then The teacher should land on Dashboard page

DTM - Teachers Dashboard

        And The teacher should see the <menu items> in navbar
        Examples:
        |menu items|
        |Dashboard|
        |My Classes|
        |Reports|
        And The teacher should see the profile overview
        And The teacher should see the "Do the Math" product listed in dashboard

DTM - Product Module overview

        When The teacher clicks Launch button on Do the Math product
        Then The teacher should land on "Do The Math" page
        And The teacher should see "Assessments" sub menu in TOC
        And The teacher should see <sections> on Module Overview - TBD (Need to discuss with Poprockers)
        Examples:
        |sections|
        |Into Video|
        |Overview Video|
        |Other Resources|

DTM - Assessments module

        When The teacher clicks Assessments sub menu
        Then The teacher should land on Assessments page
        And The "Beginning of Module Assessment" should be displayed - TBD (Need to discuss with Poprockers)
        And The "Objectives Tracker" should be displayed - TBD (Need to discuss with Poprockers)
        And The "Interview Assessment" should be displayed - TBD (Need to discuss with Poprockers)
        And The teacher should see an eligible <assessments> to create assessments.
        Example:
        |assessments|
        |Number Core Beginning of Module Assessment|
        
        And The ePub module should be available

        When The teacher clicks Preview button on "Beginning of Module Assessment"
        Then The PDF of "Beginning of Module Assessment" should open in new tab/Same tab
        When The teacher clicks Download PDF button on "Beginning of Module Assessment" preview page
        Then The teacher should download the "Beginning of Module Assessment" PDF
        When The teacher clicks Back button
        Then The teacher should land on Assessments page

        When The teacher clicks Preview button on "Objectives Tracker"
        Then The PDF of "Objectives Tracker" should open in new tab/Same tab
        When The teacher clicks Download PDF button on "Objectives Tracker" preview page
        Then The teacher should download the "Objectives Tracker" PDF
        When The teacher clicks Back button
        Then The teacher should land on Assessments page

        When The teacher clicks Preview button on "Interview Assessment"
        Then The PDF of "Interview Assessment" should open in new tab/Same tab
        When The teacher clicks Download PDF button on "Interview Assessment" preview page
        Then The teacher should download the "Interview Assessment" PDF
        When The teacher clicks Back button
        Then The teacher should land on Assessments page

        When The teacher clicks open button on ePub
        Then The ePub content should open in new tab
        When The teacher clicks Back button
        Then The teacher should land on Assessments page

DTM - Create Assessments module
        When The teacher clicks "Number Core Beginning of Module Assessment" assessment
        Then The teacher should land on Create Assignment page
        When The teacher create an assignment with "Assignment Name"
        Then The created assignment should be list in Assessments page "Assignment Name" 
        And The success message should be displayed    