*** Settings ***
Library           SeleniumLibrary
Resource          UI分层一.txt
Resource          UI分层二.txt

*** Test Cases ***
测试用例原始代码
    Open Browser    https://www.baidu.com    firefox
    Input Text    id = kw    selenium
    Click Button    id = su
    Wait Until Page Contains Element    css = #su
    sleep    2
    ${title}    get title
    Should Contain    ${title}    selenium_百度搜索
    Close Browser

分层一用例
    打开浏览器    https://www.baidu.com    firefox
    输入框    selenium
    点击百度搜索按钮
    等待时间
    验证标题    selenium_百度搜索
    关闭浏览器

分层二用例
    验证百度搜索    https://www.baidu.com    firefox    selenium    selenium_百度搜索
