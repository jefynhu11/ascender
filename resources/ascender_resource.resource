*** Settings ***
Resource            ../page_objects/home_page.resource

*** Keywords ***
open the browser
    Open Browser    ${URL}  ${BROWSER}   options=add_argument("--disable-notifications");add_experimental_option("excludeSwitches",["enable-logging"])
    Maximize Browser Window

close the browser
    Close Browser

access the website
    Go To               url=${URL}

#GHERKIN

I am on website ASCENDER
    Go To               url=${URL}

I click at "Quem Somos"
    Click Element       ${QUEM_SOMOS}

I click at 'O que fazemos'
    Click Element       ${O_QUE_FAZEMOS}

I click at 'TRABALHE CONOSCO'
    Click Element       ${TRABALHE_CONOSCO}

I click at 'Sabia Mais'
    Click Element       ${SABIA_MAIS}

the page title should be "${TITLE}"
    Title Should Be     title=${TITLE}

fill in the fields
    [Arguments]         ${NAME}   ${EMAIL}  ${MOBILE}    ${MESSAGE}
    Input Text          ${NAME_FIELD}       ${NAME}
    Input Text          ${EMAIL_FIELD}      ${EMAIL}
    Input Text          ${PHONE_FIELD}      ${MOBILE}
    Input Text          ${MESSAGE_FIELD}    ${MESSAGE}

click button submit
    Wait Until Keyword Succeeds   3 times    5 sec   Click Button        ${SEND_BUTTON}

check if send with succeed
    Wait Until Element Is Visible           ${SUCCESS_TEXT}
    ${txt_element} =                        Get Text            ${SUCCESS_TEXT}
    Should Contain                          ${txt_element}      Contato enviado com sucesso 😍