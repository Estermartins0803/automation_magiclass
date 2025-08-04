*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem
Resource    ../variables/base_variables.resource

*** Keywords ***
Open site
    Open Browser    url=${url}    browser=chrome    options=--headless --no-sandbox --disable-dev-shm-usage --remote-debugging-port=9222 --user-data-dir=/tmp/chrome-profile
    Maximize Browser Window

Close site
    Close Browser