*** Settings ***
Resource          model.robot

*** Test Cases ***
test_case
    myrange    5
    ${c}    add    5    3
    log    ${c}

test_case2
    [Setup]    start
    log    this is test case
    [Teardown]    end

*** Keywords ***
start
    log    start test case

end
    log    end test case
