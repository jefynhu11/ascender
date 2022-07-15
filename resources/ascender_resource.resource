*** Settings ***
Resource            ../page_objects/home_page.resource

*** Keywords ***
check the page title is "${TITLE}"
    Title Should Be     title=${TITLE}

click menu 'Quem Somos'    
    Click Element       ${QUEM_SOMOS}

click menu 'O que fazemos'
    Click Element       ${O_QUE_FAZEMOS}

click menu 'TRABALHE CONOSCO'
    Click Element       ${TRABALHE_CONOSCO}

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
    Get Text                                ${SUCCESS_TEXT}
