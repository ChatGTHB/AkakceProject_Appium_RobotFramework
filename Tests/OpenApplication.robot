*** Settings ***
Resource    ../Resources/resources.robot


*** Test Cases ***
Search For Product
  [Tags]    openApp
  Open Application
  ...  remote_url=http://localhost:4723
  ...  platformName=Android
  ...  platformVersion=11.0
  ...  deviceName=emulator
  ...  appPackage=com.akakce.akakce
  ...  appActivity=com.akakce.akakce.ui.splash.SplashActivity
  ...  automationName=Uiautomator2
  Wait Until Page Contains Element      ${pop_up_message}  timeout=15
  Click Element                         ${pop_up_message}
  Wait Until Page Contains Element      ${search_input_field}
  Click Element                         ${search_input_field}
  Wait Until Page Contains Element      ${search_input_field2}
  Input Text                            ${search_input_field2}  Bilgisayar
  Press Keycode    66
  Wait Until Page Contains Element      ${first_product}
  Click Element                         ${first_product}
  Wait Until Page Contains Element      ${ürüne_git_button}
  Click Element                         ${ürüne_git_button}
  Scroll To Takip Et Button
  Click Element    ${takip_et_button}
  Sleep  5

Search For Bilgisayar
  [Tags]    search
  Open Akakce Application
  Close Pop Up Message
  Type Bilgisayar In The Search Box And Click Enter
  Select First Product
  Go To Selected Product
  Scroll To Takip Et Button
  Click On Takip Et Button
  Verify Login Page Displayed

Login Akakce Application
  Open Akakce Application
  Close Pop Up Message
  Click On User Icon
  Verify Login Page Displayed
  Click On Hesap Olustur Button
  Enter Register Details