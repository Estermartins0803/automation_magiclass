*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem
Resource    ../variables/base_variables.resource

*** Keywords ***
Open site
    Open Browser    url=${url}    browser=chrome    options=--headless    options=--no-sandbox    options=--disable-dev-shm-usage    options=--remote-debugging-port=9222    options=--user-data-dir=/tmp/chrome-profile
    Maximize Browser Window

Close site
    Close Browser