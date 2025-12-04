*** Settings ***
Documentation     Browser utility keywords that use global configuration.
Library           SeleniumLibrary
Resource         ../config/global_config.robot

*** Keywords ***
Open Configured Browser
    [Documentation]    Open browser based on ${ENVIRONMENT} (LOCAL/REMOTE) and go to ${BASE_URL}.
    Run Keyword If     '${ENVIRONMENT}' == 'LOCAL'    Open Local Browser
    ...    ELSE    Open Remote Browser

Open Local Browser
    [Documentation]    Open headless Chrome on local machine (works in GitHub Actions)
    ${options}=    Create List
    ...    --headless=new
    ...    --no-sandbox
    ...    --disable-dev-shm-usage
    ...    --disable-gpu
    ...    --window-size=1920,1080

    # Open browser with options — DO NOT use desired_capabilities
    Open Browser    ${BASE_URL}    chrome    options=${options}

Open Remote Browser
    [Documentation]    Open browser on remote Selenium/Grid node using ${REMOTE_URL}.
    ${desired_caps}=   Create Dictionary    browserName=${BROWSER}    browserVersion=${BROWSER_VERSION}
    Open Browser    ${BASE_URL}    ${BROWSER}    remote_url=${REMOTE_URL}    desired_capabilities=${desired_caps}
    Maximize Browser Window




