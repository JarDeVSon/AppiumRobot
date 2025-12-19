*** Settings ***
## Carrega as variáveis do arquivo `.env`
Library    resources/libs/DotEnv.py    # robotcode: ignore

## Bibliotecas
Library    AppiumLibrary  timeout=30
Library    BrowserstackLibrary   username=%{BROWSERSTACK_USERNAME=${None}}  access_key=%{BROWSERSTACK_ACCESS_KEY=${None}}    # robotcode: ignore
Library    String
Library    Process
Library    OperatingSystem
Library    Collections
Library    String

## Utils
Resource    resources/utils/openApp.resource
Resource    resources/utils/customKeywords.resource

## Locators
Variables    resources/locators/homeLocators.yaml
Variables    resources/locators/interestLocators.yaml
Variables    resources/locators/lookingForLocators.yaml
Variables    resources/locators/signInLocator.yaml
Variables    resources/locators/welcomeLocators.yaml
Variables    resources/locators/searchLocators.yaml
Variables    resources/locators/resultSearch.yaml

## Pages
Resource    resources/pages/homePage.resource
Resource    resources/pages/interestPage.resource
Resource    resources/pages/lookingForPage.resource
Resource    resources/pages/signInPage.resource
Resource    resources/pages/welcomePage.resource
Resource    resources/pages/searchPage.resource
Resource    resources/pages/resultSearchPage.resource

*** Variables ***
${PLATFORM_NAME}   android  #android ou ios
${EMULATOR}        local    #local ou browserstack
${AUTOMATION_NAME}  UIAutomator2  # UIAutomator2 or XCUITest
${DEVICE_NAME}     Google Pixel 7 Pro    # Google Pixel 7 Pro or iPhone 14 Pro Max
${BS_USER_NAME}        %{BROWSERSTACK_USER_NAME=${None}}
${BS_ACCESS_KEY}       %{BROWSERSTACK_ACCESS_KEY=${None}}
&{BROWSERSTACK_OPTIONS}          appiumVersion=2.0.1
${APP_DOWNLOAD_URL}              %{APP_DOWNLOAD_URL=${None}}