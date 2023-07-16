*** Settings ***
Resource    ../Resources/common.robot

Test Setup    Open Akakce Application
Test Teardown    Close Application

*** Test Cases ***
Register Akakce Application
  [Tags]    register
  Close Pop Up Message
  Click On User Icon
  Verify Login Page Displayed
  Click On Hesap Olustur Button
  Enter Register Details
  Accept Terms And Conditions
  Click On Register Button
  Verify New User Is Created

Login With Standard User
  [Tags]    login
  Close Pop Up Message
  Click On User Icon
  Verify Login Page Displayed
  Enter Standard User Login Credentials
  Click On Login Button
  Verify User Is Logged In



