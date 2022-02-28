*** Settings ***
Test Setup
Test Teardown     Close All Applications
Resource          ../Lib&Variables/Variables.robot
Resource          ../Lib&Variables/Commonkeyworks.robot
Resource          ../Screen/HomeScr.robot
Resource    ../Screen/AccountScr.robot
Library           AppiumLibrary

*** Test Cases ***
220222002_Login_by_a_registered_email
    [Setup]    Commonkeyworks.Get Data Test    ${excel_path}    0.1-1. Sign In Successfully
    Commonkeyworks.OpenProphetApp
    HomeScr.LogIn    ${test_data[0]['Email']}    ${test_data[0]['Pass']}
    Sleep    15
    Wait Until Page Contains    Allow Prophet Exchange to access this device's location?    ${time_out}
    ClickButton    com.android.packageinstaller:id/permission_allow_button
    Wait Until Page Does Not Contain    Allow Prophet Exchange to access this device's location?    ${time_out}
    NavigateToAccountScr
    NavigateToProfileScr
    Element Should Contain Text    //android.widget.TextView[contains(@text,'${test_data[0]['Email']}')]    ${test_data[0]['Email']}
    BackToAccountScr
    AccountScr.LogOut    ${test_data[0]['First Name']}    ${test_data[0]['Last Name']} 
    [Teardown]    FillResult    0.1-1. Sign In Successfully    3    ${TEST_STATUS}