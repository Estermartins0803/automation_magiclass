*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem
Resource    ../variables/base_variables.resource

*** Keywords ***
Open site
    Open Browser    url=${url}    browser=chrome
    Maximize Browser Window

Close site
    Close Browser