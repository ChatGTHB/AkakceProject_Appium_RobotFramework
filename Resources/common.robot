*** Settings ***
Library    AppiumLibrary
Resource    accounts_page.robot
Resource    home_page.robot
Resource    search_page.robot

*** Variables ***
${pop_up_message}                           id=framePopupLyt
${execution_env}                            local           #default variable
${user}                                     standard_user1  #default variable


*** Keywords ***
Open Akakce Application
  Run Keyword If    "${execution_env}"=="local"
  ...  Open Akakce Application In Local
  Run Keyword If    "${execution_env}"=="browserstack"
  ...  Open Akakce Application In Browserstack


Open Akakce Application In Local
  Open Application
  ...  remote_url=http://localhost:4723
  ...  platformName=Android
  ...  platformVersion=11.0
  ...  deviceName=emulator
  ...  appPackage=com.akakce.akakce
  ...  appActivity=com.akakce.akakce.ui.splash.SplashActivity
  ...  automationName=Uiautomator2

Open Akakce Application In Browserstack
  Open Application
  ...  remote_url=http://murat_se8XL7:UvTCSqhxkwLPniCy482Z@hub.browserstack.com/wd/hub
  ...  platformName=Android
  ...  platformVersion=11.0
  ...  deviceName=Samsung Galaxy S21
  ...  appPackage=com.akakce.akakce
  ...  appActivity=com.akakce.akakce.ui.splash.SplashActivity
  ...  automationName=Uiautomator2
  ...  app=bs://23d8de49cb7dde80f1c8c9bd23edb40e5e31c50f
  ...  buildName=Smoke Tests
  ...  projectName=Akakce

Close Pop Up Message
  Wait Until Page Contains Element      ${pop_up_message}  timeout=15
  Click Element                         ${pop_up_message}

Scroll To Element
  [Arguments]    ${element}
  ${isElementVisible}  Run Keyword And Return Status  Element Should Be Visible      ${element}
  WHILE    "${isElementVisible}" == "False"
       Swipe By Percent    50    80    50    30
       ${isElementVisible}  Run Keyword And Return Status  Element Should Be Visible  ${element}
  END