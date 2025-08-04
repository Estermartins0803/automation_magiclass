*** Settings ***
Library          SeleniumLibrary
Resource         ../steps/login_steps.resource
# Test Teardown    Close site

*** Test Cases ***
Correct login
    Given que possuo os dados corretos de um login
    And que esteja na página de login do sistema
    When informar as credenciais de login
    And clicar em entrar
    Then deverá ser realizado o login corretamente

Login with password invalid
    Given que possuo as credenciais de um login, mas com a senha incorreta
    And que esteja na página de login do sistema
    When informar as credenciais de login
    And clicar em entrar
    Then deverá aparecer uma mensagens de erro no login

Login without password
    Given que possuo os dados corretos de um login
    And que esteja na página de login do sistema
    When informar as credenciais de login, não informando a senha
    And clicar em entrar
    Then deverá aparecer uma mensagens de erro no login

Login without email
    Given que possuo os dados corretos de um login
    And que esteja na página de login do sistema
    When informar as credenciais de login, não informando o e-mail
    And clicar em entrar
    Then deverá aparecer uma mensagens de erro no login

Login with email upper case
    Given que possuo os dados corretos de um login
    And que esteja na página de login do sistema
    When informar as credenciais de login, mas convertendo o e-mail para upper case
    And clicar em entrar
    Then deverá aparecer uma mensagens de erro no login