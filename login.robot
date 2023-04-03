*** Settings ***
Library    AppiumLibrary
Resource	object.robot
*** Variables ***
${APPIUM_SERVER}    http://0.0.0.0:4723/wd/hub
${PLATFORM_NAME}    Android
${DEVICE_NAME}    Android Emulator
${APP}    ${CURDIR}/Login & Registration Example_3.0_Apkpure.apk
${APP_PACKAGE}    com.appsgallery.sagar.loginregistrationexample
${APP_ACTIVITY}    com.appsgallery.sagar.loginregistrationexample.MainActivity
*** Test cases ***
Valid Account Test
    Launch Mobile Application
    Register User
    Go Back
    Login
    Verify Success Login
    Close Application

Invalid Account Test
    Launch Mobile Application
    Login
    Verify Failed Login
    Close Application

Empty Username Test
    Launch Mobile Application
    Login Empty Username
    Verify Failed Login
    Close Application

Empty Password Test
    Launch Mobile Application
    Login Empty Password
    Verify Failed Login
    Close Application

*** Keywords ***
Launch Mobile Application
    Open Application    ${APPIUM_SERVER}
    ...    platformName=${PLATFORM_NAME}
    ...    deviceName=${DEVICE_NAME}
    ...    app=${APP}
    ...    appPackage=${APP_PACKAGE}
    ...    appActivity=${APP_ACTIVITY}
Register User
    Click Element    ${Form.Login.Register.Btn}
    Sleep    2s
    Wait Until Element Is Visible    ${Form.Register.Username.Txt}    
    Input Text    ${Form.Register.Username.Txt}    imam.isfahani
    Input Text    ${Form.Register.Password.Txt}    isfahani
    Input Text    ${Form.Register.Confirm.Txt}    isfahani
    Click Element    ${Form.Register.Create.Btn}    
        
Login
    Input Text    ${Form.Login.Username.Txt}    imam.isfahani   
    Input Text    ${Form.Login.Password.Txt}    isfahani
    Sleep    2s
    Click Element    ${Form.Login.Login.Btn}
    Click Element    ${Form.Login.Login.Btn}
    Sleep    1s

Login Empty Username  
    Input Text    ${Form.Login.Password.Txt}    wrong
    Sleep    2s
    Click Element    ${Form.Login.Login.Btn}
    Click Element    ${Form.Login.Login.Btn}
    Sleep    1s

Login Empty Password
    Input Text    ${Form.Login.Username.Txt}    imam.isfahani
    Sleep    2s
    Click Element    ${Form.Login.Login.Btn}
    Click Element    ${Form.Login.Login.Btn}
    Sleep    1s

Verify Success Login
    Wait Until Element Is Visible    ${Form.Login.Success.Label}

Verify Failed Login
    Wait Until Page Does Not Contain Element    ${Form.Login.Success.Label}
    Wait Until Element Is Visible    ${Form.Login.Login.Btn}