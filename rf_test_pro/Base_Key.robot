*** Settings ***
Library           Screenshot
Library           Collections

*** Variables ***
${hi}             欢迎你第一次使用 Robot Framework。它的强大性和易用性相信会让你的测试工作变得更加简单可靠
@{company}        小米    oppo    vivo    一加    360
&{dict_demo}      xiaoli = 1999    huawei = 2999    oppo = 3999

*** Test Cases ***
variable
    #Set variable 设置变量值关键字
    ${a}    Set variable    Hello World
    log    ${a}

list
    #创建列表
    ${abc}    Create list    Bob    Alice    Keep
    log    ${abc}
    log many    ${abc[0]}    #打印出索引上的值
    log many    @{company}[0]

catenate
    ${hi}    Catenate    Hello    World
    log    ${hi}

if
    #if语法 方法一
    ${a}    Set variable    91
    run keyword if    ${a}>=90    log    优秀
    ...    ELSE IF    ${a}>=70    log    良好
    ...    ELSE IF    ${a}>=60    log    及格
    ...    ELSE    log    不及格
    #方法二
    ${b}    Set variable    59
    run keyword if    ${b}>=90    log    优秀
    ...    ELSE IF    ${b}>=70    log    良好
    ...    ELSE IF    ${b}>=60    log    及格
    ...    ELSE    log    不及格

for
    #for循环
    #打印出0-9数字
    : FOR    ${a}    IN RANGE    10
    \    log    ${a}
    log    +++++++++++++
    #打印出1-9数字
    : FOR    ${b}    IN RANGE    1    10
    \    LOG    ${b}
    log    --------
    #1-10 间隔1打印
    : FOR    ${c}    IN RANGE    1    10    1
    \    Log    ${c}
    log    ++++++++++
    #循环打印出list
    @{List}    Create List    BOB    OPPO    Xiaomi    Tz
    : FOR    ${abc}    IN    @{List}
    \    log    ${abc}
    log    ---------
    #嵌套If
    @{List}    Create List    BOB    OPPO    Xiaomi    Tz
    : FOR    ${abc}    IN    @{List}
    \    Run Keyword If    '${abc}'=='BOB'    Exit For Loop    #类似于Break中断

Evaluate
    #RF中一切数字类型皆为字符串
    #Evaluat随机打印
    ${a}    Evaluate    random.randint(1000,9999)    random
    log    ${a}
    #导入第三方模块
    Comment    Import Library    D:/Project/TestCase/robotframework/test_add.py
    Comment    ${bb}    Set Variable    5
    Comment    ${cc}    Set Variable    5
    Comment    ${add}    add    ${bb}    ${cc}
    Comment    log    ${add}
    #借助evaluat函数转换
    Import Library    D:/Project/TestCase/robotframework/test_add.py
    ${bb}    Evaluate    int(5)
    ${cc}    Evaluate    int(6)
    ${add}    add    ${bb}    ${cc}
    log    ${add}
    #函数二
    Comment    Import Library    D:/Project/TestCase/robotframework/count.py
    Comment    ${add}    count.add    3    5
    Comment    log    ${add}
    Comment    ${sub}    count.sub    3    5
    Comment    log    ${sub}

time
    ${t}    Evaluate    time.ctime()    time
    log    ${t}

time1
    #获取时间
    ${t}    get time
    log    ${t}
    #设置等待时间
    sleep    5

for_list
    @{i}    create list    a    b    c
    : FOR    ${abc}    IN    @{i}
    \    log    ${abc}

for_exit
    @{i}    create list    a    b    c
    : FOR    ${abc}    IN    @{i}
    \    Exit For Loop If    "${abc}"=="c"
    log    ${abc}

dict
    #创建字典
    ${dict}    Create Dictionary    xiaomi    999    vivo    1299
    log many    ${dict}
    #打印出字典的键值
    ${item}    Get Dictionary Items    ${dict}
    log    ${item}
    #打印出字典的键
    ${key}    Get Dictionary Keys    ${dict}
    log    ${key}
    #打印出字典的值
    ${value}    Get Dictionary Values    ${dict}
    log    ${value}
    ${v}    Get From Dictionary    ${dict}    vivo
    log    ${v}
    log    ${hi}
    #打印出变量字典
    log many    &{dict_demo}
    ${aaaa}

test case4
    [Tags]    重要
    log    @{company}${hi}
    : FOR    ${n}    IN    @{company}
    \    log    ${n}

Take_Screenshot
    log    开始截图
    Take Screenshot
    log    结束截图
