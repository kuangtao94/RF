*** Settings ***
Library           DatabaseLibrary

*** Test Cases ***
Database_select查询
    #链接数据库
    Connect To Database Using Custom Params    pymysql    db="test",user="root",password="123456",host="localhost",port=3306
    ${select}    Query    SELECT * FROM student WHERE id = 4
    log    ${select}
    Disconnect From Database

Database_insert插入
    #链接数据库
    Connect To Database Using Custom Params    pymysql    db="test",user="root",password="123456",host="localhost",port=3306
    ${insert}    Execute Sql String    INSERT INTO student(id,name,age,address) values(4,'小米','23','北京')
    log    ${insert}
    Disconnect From Database

Database_update更新
    #链接数据库
    Connect To Database Using Custom Params    pymysql    db="test",user="root",password="123456",host="localhost",port=3306
    ${update}    Execute Sql String    UPDATE student SET name='oppo' WHERE id = 4
    log    ${update}
    Disconnect From Database

Database_delete删除
    #链接数据库
    Connect To Database Using Custom Params    pymysql    db="test",user="root",password="123456",host="localhost",port=3306
    ${delete}    Execute Sql String    DELETE FROM student WHERE id = 4
    log    ${delete}
    ${select}    Query    SELECT * FROM student WHERE id = 4
    log    ${select}
    Disconnect From Database
