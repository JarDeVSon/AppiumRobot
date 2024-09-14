*** Settings ***
Resource    ../../base.resource

*** Keywords ***
View Home
    
    Wait Until Element Is Visible    ${home.${PLATFORM_NAME}.homeScreen}

Click In Browse Tab Icon

    Wait Visible And Click Element    ${home.${PLATFORM_NAME}.discoverButton}

Click in Surprise Me

    Swipe Until Element Is Visible    ${home.${PLATFORM_NAME}.surpriseMeButton}
    Click Element    ${home.${PLATFORM_NAME}.surpriseMeButton}