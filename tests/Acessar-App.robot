*** Settings ***
Resource      ../base.resource

*** Test Cases ***
Cenário: Acessar TED sem Login
    [Tags]    regressivo
    
    Click in Lets Go
    Select Interests    Technology
    Select Looking For    Professional growth
    Skip Sing In
    View Home