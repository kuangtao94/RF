*** Settings ***
Library           SeleniumLibrary
Resource          baidu业务.txt
Resource          UI分层一.txt

*** Test Cases ***
baidu_case
    打开浏览器    https://www.baidu.com    chrome
    输入框    robotframework
    点击百度搜索按钮
    等待时间
    验证标题    robotframework_百度搜索
    关闭浏览器

selenium_api_id定位
    #打开浏览器
    Open Browser    http://www.baidu.com    gc
    #通过id定位文本框
    Input Text    id = kw    selenium
    #点击百度搜索按钮
    Click Element    id = su
    log    搜索成功
    #关闭浏览器
    Close Browser

selenium_api_name定位
    #打开浏览器
    Open Browser    http://www.baidu.com    gc
    #通过name定位文本框
    Input Text    name = wd    selenium
    #点击百度搜索按钮
    Click Element    su
    log    搜索成功
    #关闭浏览器
    Close Browser

selenium_api_link_text定位
    #打开浏览器
    Open Browser    http://www.baidu.com    gc
    #通过link点击新闻链接
    Click Link    link = 新闻
    log    跳转新闻首页
    #关闭浏览器
    Close Browser

selenium_api_css定位
    #打开浏览器
    Open Browser    http://www.baidu.com    gc
    #css简写定位 id-># class->.
    #通过css定位文本框
    Comment    Input Text    css=#kw    selenium
    #点击百度搜索按钮
    Comment    Click Element    css=#su
    #通过css属性定位
    Comment    Input Text    css=input#kw    selenium
    Comment    Input Text    css=input[id='kw']    selenium
    #点击百度搜索按钮
    Comment    Click Element    css=input[id='su']
    #css层级定位
    Input Text    css=form#form>span>input    selenium
    Comment    Input Text    css=.quickdelete-wrap>input#kw    selenium
    #点击百度搜索按钮
    Click Element    su
    log    搜索成功
    #关闭浏览器
    Close Browser

selenium_api_xpath定位
    #打开浏览器
    Open Browser    http://www.baidu.com    gc
    #通过xpath属性定位
    Comment    Input Text    //input[@id='kw']    selenium
    #点击百度搜索按钮
    Comment    Click Element    //input[@id='su']
    #xpath层级定位
    Input Text    //form[@id='form'/span/input    selenium
    Comment    Input Text    //span[@class=bg s_ipt_wr quickdelete-wrap/input    selenium
    #点击百度搜索按钮    #通过and定位
    Click Element    //input[@id="su"and@type="submit"]
    log    搜索成功
    #关闭浏览器
    #有关contains函数    #点击新闻链接
    Click Element    //a[contains(text(),"新闻")]    #contains定位文本中的函数
    Close Browser

selenium_api_jquery定位
    #打开浏览器
    Open Browser    http://www.baidu.com    gc
    #通过jquery定位文本
    Execute Javascript    $("input#kw").val('selenium')
    Execute Javascript    $("input#su").click()
    #关闭浏览器
    Close Browser

selenium_api_浏览器的相关操作
    #打开浏览器
    Open Browser    http://www.baidu.com    gc
    #点击新闻链接
    Click Element    link=新闻
    sleep    2
    #返回百度首页
    Go Back
    #再一次访问新闻链接
    Go To    http://news.baidu.com/
    #刷新页面
    Reload Page
    #设置窗口的长和宽
    Set Window Size    600    800
    #获取窗口的长和宽
    ${weight}    ${height}    Get Window Size
    log    ${weight}
    log    ${height}
    Close Browser

selenium_api_设置元素等待时间
    #打开浏览器
    Open Browser    http://www.baidu.com    gc
    #强制等待
    sleep    2
    #隐性等待
    Set Browser Implicit Wait    3
    #点击新闻链接
    Click Element    link=新闻
    #最大化窗口
    Maximize Browser Window
    #等待某个元素出现
    Wait Until Page Contains Element    link=高级搜索
    log    成功
    Close Browser

selenium_api_获取文本和标题
    #打开浏览器
    Open Browser    http://www.baidu.com    gc
    #强制等待
    sleep    2
    Input Text    kw    selenium
    Click Button    su
    sleep    5
    #获取文本
    ${text}    Get Text    css=#container > div.head_nums_cont_outer.OP_LOG > div > div.nums > span    #打印出百度为您找到相关结果约27,800,000个
    log    ${text}
    #获取标题
    ${title}    Get Title
    log    ${title}

selenium_api_断言的使用
    #打开浏览器
    Open Browser    http://www.baidu.com    gc
    #强制等待
    sleep    2
    Input Text    kw    selenium
    Click Button    su
    sleep    5
    #获取文本
    ${text}    Get Text    css=#container > div.head_nums_cont_outer.OP_LOG > div > div.nums > span    #打印出百度为您找到相关结果约27,800,000个
    Page Should Contain    百度为您找到相关结果约27,800,000个
    Should Contain    ${text}    百度为您找到相关结果约27,800,000个

selenium_api_iframe表单操作
    Open Browser    http://mail.126.com    gc
    Sleep    3
    Click Element    lbNormal
    Select Frame    id=x-URS-iframe    #进入iframe
    Input Text    name=email    taoooo
    log    切换iframe成功
    Unselect Frame    #退出iframe

selenium_api_执行javascript
    #打开浏览器
    Open Browser    http://www.baidu.com    gc
    Input Text    id = kw    selenium
    Click Element    id = su
    #获取窗口的长和宽
    ${weight}    ${height}    Get Window Size
    #执行Execute Javascript
    Execute Javascript    window.scrollTo(0.2500)    #纵向从0-2500
    sleep    3
    Set Window Size    400    500
    Execute Javascript    window.scrollTo(0.2500)    #横向从0-2500
    sleep    3
    Close All Browsers

selenium_api_多窗口切换
    #打开浏览器
    Open Browser    http://www.baidu.com    gc
    Maximize Browser Window
    Sleep    3
    Input Text    kw    渗透吧
    Click Element    su
    Sleep    3
    Click Element    //*[@id='1']/h3/a/em    Get Window Size
    #new 切换到新的窗口
    Select Window    new
    sleep    3
    Click Link    link=进入贴吧    500
    log    加载完毕
    sleep    3
    Select Window    title=渗透吧_百度搜索
    log    切换回首窗口
    Close All Browsers

selenium_api_鼠标悬停
    #打开浏览器
    Open Browser    http://www.baidu.com    gc
    Set Browser Implicit Wait    3
    Maximize Browser Window
    Mouse Over    tj_briicon    #悬挂到更多产品上
    Sleep    5
    Mouse Down    tj_nuomi    #点击百度糯米点击不松开
    Sleep    5
    Mouse Up    tj_nuomi    #点击百度糯米释放
    Sleep    5
    Mouse Over    css=span.arrow-down-line    #悬挂到深圳
    Sleep    5
    #点击北京
    Click Link    link=北京
