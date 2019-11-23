*** Settings ***
Library            SeleniumLibrary

*** Test Cases ***
testcase
    log    robot framework
	Open Browser    https://www.baidu.com    Chrome
	Input Text    id = kw    robot framework
	Click Button    id = su
	Close Browser