*** Settings ***
Library     SeleniumLibrary
Resource    ../../utils/base_util.resource
Resource    ../../pages/login_page.resource
Resource    ../../variables/base_variables.resource
Resource    ../../pages/register_page.resource
Resource    ../../utils/generators/base_generator.resource


*** Keywords ***
que possuo os dados corretos de um login
    Set Test Variable     ${email}       ${correct_email}
    Set Test Variable     ${password}    ${correct_password}

que possuo as credenciais de um login, mas com a senha incorreta
    ${pass}=    Generate password
    Set Test Variable     ${email}       ${correct_email}
    Set Test Variable     ${password}    ${pass}

que esteja na página de login do sistema
    Open site

informar as credenciais de login
    Set email        ${email}
    Set password     ${password}

informar as credenciais de login, não informando a senha
    Set email        ${email}
    Set password

informar as credenciais de login, não informando o e-mail
    Set email
    Set password     ${password}

informar as credenciais de login, mas convertendo o e-mail para upper case
    ${email_send}=    Convert To Upper Case    ${email}
    Set email        ${email_send}
    Set password     ${password}

clicar em entrar
    Click button enter

deverá ser realizado o login corretamente 
    Wait button logout clickable

deverá aparecer uma mensagens de erro no login
    Verify error login