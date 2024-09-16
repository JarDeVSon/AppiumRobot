*** Settings ***
Resource      ../base.resource
Test Tags     regressivo
*** Test Cases ***
Cenário: Acessar TED sem Login
    
    Click in Lets Go
    Select Interests    Technology
    Select Looking For    Professional growth
    Skip Sing In
    View Home