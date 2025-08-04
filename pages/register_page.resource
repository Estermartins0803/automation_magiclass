*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BUTTON_LOGOUT_SELECTOR}=    //header//a[text() = 'Deslogar']

*** Keywords ***
Wait button logout clickable
    Wait Until Element Is Visible    ${BUTTON_LOGOUT_SELECTOR}
    Wait Until Element Is Enabled    ${BUTTON_LOGOUT_SELECTOR}

Click button logout
    Click Button    ${BUTTON_LOGOUT_SELECTOR}