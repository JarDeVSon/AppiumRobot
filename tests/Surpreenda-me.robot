*** Settings ***
Resource      ../base.resource
Test Tags     regressivo

*** Test Cases ***
Cenário: Acessar Surpreenda-me

    Access TED APP Without Login    interest=Technology    lookingFor=Professional growth
    Click in Surprise Me