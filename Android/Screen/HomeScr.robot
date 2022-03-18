*** Settings ***
Resource          ../Lib&Variables/Commonkeyworks.robot
Resource          ../Lib&Variables/Variables.robot

*** Keywords ***
LogIn
    [Arguments]    ${Email}    ${Pass}
    #ClickButton    //android.widget.TextView[contains(@text,'ACCOUNT')]
    #Sleep    15
    ClickButton    //android.widget.TextView[contains(@text,'Login')]
	Sleep    ${time_out}
    Wait Until Page Contains Element    //android.widget.EditText[contains(@text,'Email Address')]    ${time_out}
    Wait Until Page Contains Element    //android.widget.EditText[contains(@text,'Password')]    ${time_out}
    #Element Should Be Disabled    //android.widget.TextView[contains(@text,'Continue')
    InputField    //android.widget.EditText[contains(@text,'Email Address')]    ${Email}
    InputField    //android.widget.EditText[contains(@text,'Password')]    ${Pass}
    ClickButton    //android.widget.TextView[contains(@text,'Continue')]
    Sleep    ${time_out}
	Page Should Not Contain Text    Login
    Page Should Not Contain Text    Register

NavigateToAccountScr
    ClickButton    //android.widget.TextView[contains(@text,'ACCOUNT')]
    Wait Until Page Contains    Withdrawable    ${time_out}
    Wait Until Page Contains    Promotional    ${time_out}
    Wait Until Page Contains Element    //android.widget.TextView[contains(@text,'Withdraw')]    ${time_out}
    Wait Until Page Contains Element    //android.widget.TextView[contains(@text,'Deposit')]    ${time_out}
    