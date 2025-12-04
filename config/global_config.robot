*** Settings ***
Documentation     Global configuration for environments, browser, and credentials.

*** Variables ***
# Environment: LOCAL or REMOTE
${ENVIRONMENT}    REMOTE

# Application under test
${BASE_URL}    XXXXX

# Browser configuration
${BROWSER}              chrome
${BROWSER_VERSION}      128.0


# Login credentials (example values; replace with real ones or override via CLI/variables file)
${VALID_USERNAME}       XXXX
${VALID_PASSWORD}       XXXX

${INVALID_USERNAME}     XXXXX
${INVALID_PASSWORD}     wrong_password



${REMOTE_URL}           XXXXX


