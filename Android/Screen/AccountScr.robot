*** Settings ***
Resource          ../Lib&Variables/Commonkeyworks.robot
Resource          ../Lib&Variables/Variables.robot
Library    AppiumLibrary

*** Keywords ***
NavigateToProfileScr
    Wait Until Page Contains Element    //android.widget.TextView[contains(@text,'Profile')]    ${time_out}
    ClickButton    //android.widget.TextView[contains(@text,'Profile')]
    Wait Until Page Contains    Personal Details    ${time_out}
    Wait Until Page Contains    Address Details    ${time_out}
    Sleep    ${time_out}

BackToAccountScr
    Go Back
    Sleep    ${time_out}
    Wait Until Page Contains    Withdrawable    ${time_out}
    Wait Until Page Contains    Promotional    ${time_out}
    Wait Until Page Contains Element    //android.widget.TextView[contains(@text,'Withdraw')]    ${time_out}
    Wait Until Page Contains Element    //android.widget.TextView[contains(@text,'Deposit')]    ${time_out}
LogOut
    [Arguments]    ${firstName}    ${lastName}
    Swipe By Percent    50     50     -50    -70  1000
    Sleep    ${time_out}
    Wait Until Page Contains Element    //android.widget.TextView[contains(@text,'Logout')]    ${time_out}
    ClickButton    //android.widget.TextView[contains(@text,'Logout')]
    Sleep    ${time_out}
    Wait Until Page Contains    Log Out    ${time_out}
    Wait Until Page Contains    Are you sure you want to log out?    ${time_out}
    Click Text    Confirm
    Wait Until Page Does Not Contain    Logging Out! You are logging out. Please wait few seconds
    Sleep    ${time_out}
    Wait Until Page Contains    Bye ${firstName} ${lastName}!    ${time_out}
    Wait Until Page Contains    You have successfully logged out. If you or someone you know has a gambling problem and wants help, call 1-800-Gambler.    ${time_out}
    Click Text    Okay!
    Wait Until Page Contains    Make sure that you are logged in to see your account.    ${time_out}