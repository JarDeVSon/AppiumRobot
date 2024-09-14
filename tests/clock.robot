*** Settings ***
Library    AppiumLibrary


*** Variables ***
${APPIUM_PORT}    4723
${APPIUM_URL}    http://localhost:${APPIUM_PORT}/wd/hub
${AUTOMATION_NAME}    uiautomator2
${PLATFORM_NAME}    android
${PLATFORM_VERSION}    14.0
${DEVICE_NAME}    emulator-5554

${APP_PACKAGE}    com.google.android.deskclock
${APP_ACTIVITY}    com.android.deskclock.DeskClock

*** Test Cases ***
Open clock app
    [Tags]  clock
    
    Open Application    ${APPIUM_URL}
    ...    automationName=${AUTOMATION_NAME}
    ...    platformName=${PLATFORM_NAME}
    ...    platformVersion=${PLATFORM_VERSION}
    ...    deviceName=${DEVICE_NAME}
    ...    appPackage=${APP_PACKAGE}
    ...    appActivity=${APP_ACTIVITY}
    
    Sleep  10

    Log Source
    Capture Page Screenshot