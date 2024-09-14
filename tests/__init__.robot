*** Settings ***
Resource    ../base.resource
Suite Setup    Send App To Browserstack
Test Setup     Open TED App
Test Teardown   Run Keywords
...    Update Test Case Status in BrowserStack    # robotcode: ignore
...    Close Application