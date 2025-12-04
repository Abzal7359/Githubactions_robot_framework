*** Settings ***
Documentation     Page object style keywords for the login page.
Library           SeleniumLibrary
Resource          ../config/global_config.robot


*** Variables ***
# Common locators (can be used across resources)
${hrm_page_loader}    //div[@class="hr-loader-wrapper"]


*** Keywords ***
Login to the hrm application using javascript with valid credentials
    Execute Javascript    document.getElementById('username').value='${VALID_USERNAME}'
    Execute Javascript    document.getElementById('kc-login').click();
    Sleep    3
    Execute Javascript    document.getElementById('phenomPassword3').value='${VALID_PASSWORD}'
    Execute Javascript    document.getElementById('kc-login').click();
    Sleep    5

Login to the hrm application using javascript with Invalid credentials
    Execute Javascript    document.getElementById('username').value='${INVALID_USERNAME}'
    Execute Javascript    document.getElementById('kc-login').click();
    Sleep    3
    Execute Javascript    document.getElementById('phenomPassword3').value='${INVALID_PASSWORD}'
    Execute Javascript    document.getElementById('kc-login').click();
    Sleep    5

Wait until loader is disappeared
    Wait Until Element Is Not Visible  ${hrm_page_loader}   120s
    Sleep    5

Verify HRM app is logged in
    Wait until loader is disappeared
    ${title}=    Get Title
    Should Be Equal    ${title}    HRM App

Verify HRM app is not logged in
    Sleep    5
    ${title}=    Get Title
    Should Be Equal    ${title}    Sign in to Phenom