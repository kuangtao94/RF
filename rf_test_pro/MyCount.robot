*** Settings ***
Library    MyTestLibrary

*** Test Case ***
${c}    add    a    b
log    ${c}
