*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${EMAIL_SELECTOR}=                  email
${PASSWORD_SELECTOR}=               password
${BUTTON_ENTER_SELECTOR}=           //button[text() = 'Entrar' and @type='submit']
${MESSAGE_ERROR_LOGIN_SELECTOR}=    login-error


*** Keywords ***
Set email
    [Arguments]    ${email}=${null}
    IF    '${email}'!=${null}
            Input Text    ${EMAIL_SELECTOR}    ${email}
    END

Set password
    [Arguments]    ${pass}=${null}
    IF   ' ${pass}'!=${null}
        Input Text    ${PASSWORD_SELECTOR}    ${pass}
    END

Click button enter
    Click Button    ${BUTTON_ENTER_SELECTOR}

Verify error login
    ${IS_FOUND}=                Set Variable    ${False}
    ${MESSAGE_ERROR_LOGIN}=     Set Variable    Erro ao fazer login
    Wait Until Element Is Visible    ${MESSAGE_ERROR_LOGIN_SELECTOR}
    FOR    ${counter}    IN RANGE    0    10    
        ${MESSAGE_FOUND}=    Get Text    ${MESSAGE_ERROR_LOGIN_SELECTOR}
        IF    '${MESSAGE_FOUND}' == '${MESSAGE_ERROR_LOGIN}'
            ${IS_FOUND}    Set Variable    ${True}
            BREAK
        ELSE
            Sleep  time_=1s  
        END
    END

    IF    ${IS_FOUND} == ${False}
        Fail    msg=Mensagem de erro ao realizar login não apareceu após 10 segundos (ou está com um valor diferente do esperado). Mensagem encontrada no seletor: '${MESSAGE_FOUND}'
    END