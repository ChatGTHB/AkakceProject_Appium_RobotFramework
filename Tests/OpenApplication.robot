*** Settings ***
Library  AppiumLibrary

*** Variables ***
#${pop_up_message}      id=com.akakce.akakce:id/framePopupLyt
${pop_up_message}       id=framePopupLyt
${search_input_field}   id=searchText
${search_input_field2}  xpath=(//*[@resource-id='com.akakce.akakce:id/searchTextView'])[2]
${first_product}        xpath=(//*[@resource-id='com.akakce.akakce:id/cellContainer'])[1]
${ürüne_git_button}     id=detailBtnTextView
${takip_et_button}      xpath=//*[@text='Takip Et']

*** Keywords ***
Scroll To Takip Et Button
  ${isTakipEtButtonDisplayed}  Run Keyword And Return Status  Page Should Contain Element  ${takip_et_button}
  WHILE    "${isTakipEtButtonDisplayed}" == "False"
       Swipe By Percent    50    80    50    20
       ${isTakipEtButtonDisplayed}  Run Keyword And Return Status  Page Should Contain Element  ${takip_et_button}
  END
  Click Element    ${takip_et_button}
  Sleep    3


*** Test Cases ***
Open Akakce Application
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




