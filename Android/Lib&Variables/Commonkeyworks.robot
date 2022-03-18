*** Settings ***
Library    AppiumLibrary
Library    /Users/krin_nguyen/Documents/GitHub/qa_mobile_automation/Android/Lib&Variables/Data.py
Library    ExcelLibrary
Library    String
*** Keywords ***
OpenProphetApp
    [Documentation]    Author: Hoang
    ...
    ...    This keyword to open Phone and Prophet App (app has been installed on device)
    Open Application    ${remote_url}    platformName=${ANDROID_PLATFORM_NAME}    platformVersion=${ANDROID_PLATFORM_VERSION}    deviceName=${ANDROID_DEVICE_NAME}    appPackage=${ANDROID_APP_PACKAGE}    appActivity=${ANDROID_APP_ACTIVITY}    autoGrantPermissions=true    noReset=true    
    Sleep    ${time_out}
    Wait Until Page Contains    Login    ${time_out}
    Wait Until Page Contains    Register    ${time_out}
    Sleep    ${time_out}

GetDataTest
    [Arguments]    ${excel_path}    ${sheet_name}
    [Documentation]    Author: Hoang
    ...
    ...    - This keyword to prepare data test from excel file
    ...    - Value has been added to list *${test_data}*
    ...
    ...    Ex: In excel file have 3 columns: First Name, Last Name, Phone.
    ...    - To get value from the First row - First Name column: \ *${test_data[0]['First Name']} *
    ...    - To get value from the First row - Last Name column: \ *${test_data[0]['Last Name']} *
    ${s_data_list} =    Data.Get Data By Sheet Name    ${excel_path}    ${sheet_name}
    Set Suite Variable    ${test_data}    ${s_data_list}

GetTestcaseID
    [Documentation]    Author: Hoang
    ...
    ...    Precondition:
    ...    The test case name should be format : number_testcasename
    ...
    ...    ex: 60158_TC-712:Change an active user's email address
    ...
    ...    - "60158" : test case ID
    ...    - "_TC-712:Change an active user's email address": testcasename
    ...
    ...    Description:
    ...    - Get the testcase ID ( xxxxx ) from test case name
    ...    - Return the test case ID
    ...
    ...    Arguments:
    ...
    ...    Return: ${testcaseid}
    # for format: xxxx_TestcaseName
    Set Test Variable    ${TEST NAME}
    ${name}    Split String    ${TEST NAME}    _
    ${testcaseid}    Set Variable    ${name[0]}
    [Return]    ${testcaseid}

FillResult
    [Arguments]    ${sheet_name}    ${col_num}    ${TEST_STATUS}
    [Documentation]    Author: Hoang
    ...
    ...    This keyword has been run at Teardown to fill *${TEST_STATUS} (PASS/FAIL)* into ${testResult_path}
    ${i}    FindIndex    ${sheet_name}
    Open Excel Document    ${testResult_path}    doc_is=doc1
    Write Excel Cell    ${i}    ${col_num}    ${TEST_STATUS}    ${sheet_name}
    Save Excel Document    ${testResult_path}
    Close Current Excel Document

InputField
    [Arguments]    ${locator}    ${value}
    [Documentation]    Author: Hoang
    ...
    ...    This keyword is combined of 3 original keyword Wait, Click and Input
    Wait Until Element Is Visible    ${locator}    ${time_out}
    Click Element    ${locator}
    Input Text    ${locator}    ${value}

ClickButton
    [Arguments]    ${locator}
    [Documentation]    Author: Hoang
    ...
    ...    This keyword is combined of 2 original keyword Wait and Click
    Wait Until Element Is Visible    ${locator}    10
    Click Element    ${locator}
    Sleep    5

FindIndex
    [Arguments]    ${sheet_name}
    [Documentation]    Author: Hoang
    ...
    ...    This keyword is find and *return index* for the current Test case in excel with TestcaseID
    ${testcaseid}=    Get Testcase ID
    Commonkeyworks.Get Data Test    ${testResult_path}    ${sheet_name}
    ${total_rows}    Get Row Count By Sheet Name    ${testResult_path}    ${sheet_name}
    ${index}=    Set Variable    2
    FOR    ${i}    IN RANGE    ${total_rows}
        Return From Keyword If    ${test_data[${i}]['ID']}==${testcaseid}    ${index}
        ${index}    Evaluate    ${index} + 1
    END
    [Return]    ${i}

GetText
    [Arguments]    ${locator}
    [Documentation]    Author: Hoang
    ...
    ...    This keyword is combined of 2 original keyword Wait and Get Text
    Wait Until Element Is Visible    ${locator}    ${time_out}
    ${s_resutl}    GetText    ${locator}
    [Return]    ${result}
