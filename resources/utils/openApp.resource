*** Settings ***
Resource  ../../base.resource

*** Keywords ***
# Open TED App

#     IF    '${EMULATOR}' == 'local'
#         Open Application    
#         ...    remote_url=http://localhost:4723
#         ...    automationName=UIAutomator2
#         ...    platformName=${PLATFORM_NAME}
#         ...    deviceName=Google Pixel 7 Pro
#         ...    app=${CURDIR}${/}..${/}app${/}app.apk
#         ...    disableIdLocatorAutocompletion=${True}
#     ELSE IF  '${EMULATOR}' == 'browserstack'
#         Open Application In Browserstack    # robotcode: ignore
#         ...  automationName=UIAutomator2
#         ...  platformName=${PLATFORM_NAME}
#         ...  deviceName=Google Pixel 7 Pro
#         ...  project=TED_ROBOTCOURSES
#         ...  build=TED_%{GH_ACTIONS_RUNNER=LOCAL}
#         ...  name=${TEST_NAME}
#         ...  bstack:options=${BROWSERSTACK_OPTIONS}
#         ...  disableIdLocatorAutocompletion=${True}
#         ...  browserstack.idleTimeout=60
#         ...  interactiveDebugging=${True} 
#     END

Open TED App

    IF    '${PLATFORM_NAME}' == 'android' and '${EMULATOR}' == 'local'
        Open Application
        ...    remote_url=http://localhost:4723
        ...    automationName=UIAutomator2
        ...    platformName=Android
        ...    deviceName=Google Pixel 7 Pro
        ...    app=${CURDIR}${/}..${/}app${/}android${/}app.apk
        ...    disableIdLocatorAutocompletion=${True}

    ELSE IF    '${PLATFORM_NAME}' == 'android' and '${EMULATOR}' == 'browserstack'
        Open Application In Browserstack     # robotcode: ignore
        ...  automationName=UIAutomator2
        ...  platformName=${PLATFORM_NAME}
        ...  deviceName=Google Pixel 7 Pro
        ...  project=TED_android
        ...  build=TED_%{GH_ACTIONS_RUNNER=LOCAL}
        ...  name=${TEST_NAME}
        ...  bstack:options=${BROWSERSTACK_OPTIONS}
        ...  disableIdLocatorAutocompletion=${True}
        ...  browserstack.idleTimeout=60
        ...  interactiveDebugging=${True} 

    ELSE IF    '${PLATFORM_NAME}' == 'ios' and '${EMULATOR}' == 'local'
        Open Application
        ...    remote_url=http://localhost:4723
        ...    automationName=XCUITest
        ...    platformName=iOS
        ...    deviceName=iPhone 14
        ...    platformVersion=17
        ...    app=${CURDIR}${/}..${/}app${/}ios${/}TED.app

    ELSE IF    '${PLATFORM_NAME}' == 'ios' and '${EMULATOR}' == 'browserstack'
        Open Application In Browserstack    # robotcode: ignore
        ...    automationName=XCUITest
        ...    platformName=iOS
        ...    deviceName=iPhone 14
        ...    platformVersion=17
        ...    project=TED_ios
        ...    build=TED_%{GH_ACTIONS_RUNNER=LOCAL}
        ...    name=${TEST_NAME}
        ...    bstack:options=${BROWSERSTACK_OPTIONS}
        ...    disableIdLocatorAutocompletion=${True}
        ...    browserstack.idleTimeout=60
        ...    interactiveDebugging=${True} 

    ELSE
        Fail    Plataforma não suportada
    END
