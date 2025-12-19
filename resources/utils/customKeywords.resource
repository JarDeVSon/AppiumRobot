*** Settings ***
Resource    ../../base.resource

*** Keywords ***
Wait Until Element Is Enabled
    [Arguments]    ${locator}
    [Timeout]    10s

    WHILE    ${True}
        ${status}  Run Keyword And Return Status  Wait Until Element Is Enabled  ${locator}
        Exit For Loop If    ${status}
    END

Wait Visible And Click Element
    [Arguments]    ${locator}

    Wait Until Element Is Visible    ${locator}
    Click Element    ${locator}

Wait Enabled And Click Element
    [Arguments]    ${locator}

    Wait Until Element Is Enabled    ${locator}
    Click Element    ${locator}

Wait Visible And Input Text
    [Arguments]    ${locator}    ${text}

    Wait Until Element Is Visible    ${locator}
    Click Element    ${locator}
    Is Keyboard Shown
    Input Text    ${locator}    ${text}

Swipe to Element
    [Arguments]  ${locator}

    ${start_x}  Set Variable  550
    ${start_y}  Set Variable  1260

    WHILE    ${True}    limit=NONE
        ${status}  Run Keyword And Return Status  Wait Until Element Is Visible    ${locator}

        IF    ${status}
            Exit For Loop
        ELSE
            ${offset_x}  Set Variable  ${${start_x} + 5}
        END

        Swipe
        ...    start_x=${start_x}
        ...    start_y=${start_y}
        ...    offset_x=${offset_x}
        ...    offset_y=0
    END

Swipe Until Element Is Visible
    [Arguments]    ${locator}

    ${width}=    Get Window Width
    ${height}=   Get Window Height

    ${start_x}=  Evaluate    ${width} / 2
    ${start_y}=  Evaluate    ${height} * 0.7
    ${end_y}=    Evaluate    ${height} * 0.3

    WHILE    ${True}
        ${visible}=    Run Keyword And Return Status
        ...    Wait Until Element Is Visible    ${locator}    1

        IF    ${visible}
            Exit For Loop
        END

        Swipe
        ...    start_x=${start_x}
        ...    start_y=${start_y}
        ...    offset_x=0
        ...    offset_y=${end_y}
    END


Access TED APP Without Login
    [Arguments]    ${interest}    ${lookingFor}

    Click in Lets Go
    Select Interests   ${interest}
    Select Looking For    ${lookingFor}
    Skip Sing In
    View Home

Send App To Browserstack

    IF    '${EMULATOR}' == 'browserstack' and '${PLATFORM_NAME}' == 'android'
        Upload Application to Browserstack    # robotcode: ignore
        ...    app_name=ted.apk
        ...    app_path=${CURDIR}${/}..${/}app${/}android${/}app.apk
        ...    custom_id=TED_ANDROID_APP_

    ELSE IF    '${EMULATOR}' == 'browserstack' and '${PLATFORM_NAME}' == 'ios'
        Upload Application to Browserstack    # robotcode: ignore
        ...    app_name=ted.ipa
        ...    app_path=${CURDIR}${/}..${/}app${/}ios${/}app.ipa
        ...    custom_id=TED_IOS_APP_
    END

Cancel Version Update

    IF    '${PLATFORM_NAME}' == 'android'
        ${deniedButton}=    Set Variable    //android.widget.Button[@resource-id="android:id/button2"]
    ELSE
        ${deniedButton}=    Set Variable    //XCUIElementTypeButton[@name="Not Now"]
    END

    ${status}=    Run Keyword And Return Status
    ...    Wait Until Element Is Visible    ${deniedButton}    3

    IF    ${status}
        Wait Visible And Click Element    ${deniedButton}
    END
