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

check the page title is "${TITLE}"
    Title Should Be     title=${TITLE}

click menu 'Quem Somos'    
    Click Element       ${QUEM_SOMOS}
    ${txt_element} =                           Get Text          ${QUEM_SOMOS_TXT}
    Should Contain      ${txt_element}         Quem Somos

click menu 'O que fazemos'
    Click Element       ${O_QUE_FAZEMOS}
    ${txt_element} =                           Get Text          ${O_QUE_FAZEMOS_TXT}
    Should Contain      ${txt_element}         O que fazemos

click menu 'TRABALHE CONOSCO'
    Click Element       ${TRABALHE_CONOSCO}
    ${txt_element} =                           Get Text          ${TRABALHE_C_TXT}
    Should Contain      ${txt_element}         Trabalhe Conosco

click menu 'Sabia Mais'
    Click Element       ${SABIA_MAIS}

fill in the fields
    [Arguments]         ${NAME}  ${EMAIL}  ${PHONE}  ${MESSAGE}

    Input Text          ${NAME_FIELD}       ${NAME}
    Input Text          ${EMAIL_FIELD}      ${EMAIL}
    Input Text          ${PHONE_FIELD}      ${PHONE}
    Input Text          ${MESSAGE_FIELD}    ${MESSAGE}

click button submit
    Wait Until Keyword Succeeds   3 times    5 sec   Click Button        ${SEND_BUTTON}

check if send with succeed
    Wait Until Element Is Visible           ${SUCCESS_TEXT}
    ${txt_element} =                        Get Text            ${SUCCESS_TEXT}
    Should Contain                          ${txt_element}      Contato enviado com sucesso 😍

#GHERKIN

Given home page the Ascenderti
    access the website

When check the page title "${title}"
    check the page title is "${title}"

Then click menu "Quem Somos"
    click menu 'Quem Somos'

Then click menu 'O que fazemos'
    click menu 'O que fazemos'

Then click menu 'TRABALHE CONOSCO'
    click menu 'TRABALHE CONOSCO'

Then click menu 'Sabia Mais'
    click menu 'Sabia Mais'

And fill in the fields
    [Arguments]         ${NAME}   ${EMAIL}  ${MOBILE}    ${MESSAGE}
    fill in the fields  ${NAME}   ${EMAIL}  ${MOBILE}    ${MESSAGE}

And click button submit
    click button submit

Then check if send with succeed
    check if send with succeed