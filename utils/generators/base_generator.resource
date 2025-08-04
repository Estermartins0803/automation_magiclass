*** Settings ***
Library    FakerLibrary
Library    String


*** Keywords ***
Generate first name
    ${FIRST_NAME}    First Name    
    RETURN         ${FIRST_NAME} 

Generate last name
    ${LAST_NAME}    Last Name    
    RETURN        ${LAST_NAME} 

Generate full name
    [Arguments]   ${FIRST_NAME}    ${LAST_NAME}
    ${FULL_NAME}    Catenate    ${FIRST_NAME}    ${LAST_NAME}
    RETURN        ${FULL_NAME} 

Generate email
    [Arguments]   ${FIRST_NAME}    ${LAST_NAME}
    ${FIRST_NAME}    Convert To Lower Case    ${FIRST_NAME}
    ${LAST_NAME}     Convert To Lower Case    ${LAST_NAME}
    ${EMAIL}         Catenate    SEPARATOR=   ${FIRST_NAME}    _    ${LAST_NAME}    @xpto.com
    RETURN       ${EMAIL} 

Generate cpf
    ${CPF}    Random Number    digits=11    fix_len=${True}
    RETURN    ${CPF}

Generate password
    [Arguments]    ${len}=${9}    ${special}=${True}    ${number}=${True}    ${upper}=${True}    ${lower}=${True}
    ${PASS}=    Password    length=${len}    special_chars=${special}    digits=${number}    upper_case=${upper}    lower_case=${lower}
    RETURN       ${PASS}

Generate password without special chars
    ${PASS}=    Generate password   special=${False}
    RETURN       ${PASS}

Generate password without numbers
    ${PASS}=    Generate password    number=${False}
    RETURN       ${PASS}

Generate password without upper letters
    ${PASS}=    Generate password    upper=${False}
    RETURN       ${PASS}

Generate password without lower letters
    ${PASS}=    Generate password    lower=${False}
    RETURN       ${PASS}