*** Settings ***
Resource    ../../base.resource
Library    ../../.venv/Lib/site-packages/robot/libraries/Process.py

*** Keywords ***
Wait Until Element Is Enabled
    [Arguments]    ${locator}
    [Timeout]    10s

    WHILE    ${True}
        ${status}  Run Keyword And Return Status  Element Should Be Enabled    ${locator}
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

Simulate Face ID
    [Documentation]    Simula a autenticação Face ID no dispositivo iOS
    # Este comando requer o uso de instrumentos de simulação Face ID no iOS
    Run Process    xcrun simctl biometric enroll ${DEVICE_NAME} face
    # Comando para autenticar com Face ID no iOS
    Run Process    xcrun simctl biometric trigger ${DEVICE_NAME} face

Simulate Fingerprint
    [Documentation]    Simula a autenticação de impressão digital no dispositivo
    # Comando ADB para simular impressão digital no emulador
    Run Process    adb    -s    ${DEVICE_NAME}    emu    finger    touch    1

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

Send Test Status To Browserstack

    ${session_id}  Get Appium SessionId

    IF    '${EMULATOR}' == 'browserstack'
        Scenario Status
        ...  session_id=${session_id}
        ...  status=${TEST_STATUS}
        ...  reason=${TEST_MESSAGE}
        ...  auth=${BROWSERSTACK_AUTHORIZATION}
    END