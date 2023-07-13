*** Settings ***
Resource    ../Resources/resources.robot
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

Search For Bilgisayar
  [Tags]    search
  Close Pop Up Message
  Type Bilgisayar In The Search Box And Click Enter
  Select First Product
  Go To Selected Product
  Scroll To Takip Et Button
  Click On Takip Et Button
  Verify Login Page Displayed