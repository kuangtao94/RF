*** Keywords ***
add
    [Arguments]    ${a}    ${b}
    ${c}    Evaluate    ${a}+${b}
    [Return]    ${c}

myrange
    [Arguments]    ${times}
    : FOR    ${a}    IN RANGE    ${times}
    \    log    ${a}
