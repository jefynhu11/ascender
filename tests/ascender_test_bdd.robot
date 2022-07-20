*** Settings ***
Documentation       This suite tests the Ascender website

Library             SeleniumLibrary
Library             FakerLibrary        locale=pt_BR
Resource            ../configs/config.resource
Resource            ../resources/ascender_resource.resource
Test Setup          open the browser 
Test Teardown       close the browser

*** Test Cases ***
Test case 01 - Click menu 'Quem Somos'
    [Documentation]     Test click for menu 'who we are'
    [Tags]              menus   quem_somos

    Given I am on website ASCENDER
    When I click at "Quem Somos"
    Then the page title should be "Ascender - Elevando o nível dos sistemas da sua empresa"

Test case 02 - Click menu 'O que fazemos'
    [Documentation]     Test click for menu 'what we do'
    [Tags]              menus   o_que_fazemos

    Given I am on website ASCENDER
    When I click at 'O que fazemos'
    Then the page title should be "Ascender - Elevando o nível dos sistemas da sua empresa"
    
Test case 03 - Click menu 'Trabalhe conosco'
    [Documentation]     Test click for menu 'work with us'
    [Tags]              menus   trabalhe_consoco

    Given I am on website ASCENDER
    When I click at 'TRABALHE CONOSCO'
    Then the page title should be "Ascender - Elevando o nível dos sistemas da sua empresa"

Test case 04 - Click button 'Saiba Mais'
    [Documentation]     Test click for button 'Know more'
    [Tags]              sabia_mais

    Given I am on website ASCENDER
    When I click at 'Sabia Mais'
    Then the page title should be "Ascender - Elevando o nível dos sistemas da sua empresa"

Test case 05 - Fill in the fields, click send and ckeck with succeed
    [Documentation]     Test fill in the fields and submit
    [Tags]              fill

    ${NAME_FAKER}       FakerLibrary.Name
    ${EMAIL_FAKER}      FakerLibrary.Email
    ${MOBILE_FAKER}     FakerLibrary.Phone Number
    ${MESSAGE_FAKER}    FakerLibrary.Text

    Given I am on website ASCENDER
    When fill in the fields     ${NAME_FAKER}   ${EMAIL_FAKER}  ${MOBILE_FAKER}    ${MESSAGE_FAKER}
    And click button submit
    Then check if send with succeed