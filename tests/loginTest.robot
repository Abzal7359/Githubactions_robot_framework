*** Settings ***
Documentation     Login test suite using global config, browser utils, and login page keywords.
Library           SeleniumLibrary
Resource          ../Utils/browserUtils.robot
Resource          ../resource/loginPage.robot



*** Test Cases ***
Valid Login Should Succeed
    [Documentation]    Verify user can login with valid credentials.
    Open Configured Browser
    Login to the hrm application using javascript with valid credentials
    Verify HRM app is logged in
    Close All Browsers

Invalid Login Should Show Error
    [Documentation]    Verify error is shown when using invalid credentials.
    Open Configured Browser
    Login to the hrm application using javascript with Invalid credentials
    Verify HRM app is not logged in
    Close All Browsers


