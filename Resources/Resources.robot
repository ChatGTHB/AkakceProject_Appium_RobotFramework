*** Settings ***
Library    AppiumLibrary

*** Variables ***
#${pop_up_message}  id=com.akakce.akakce:id/framePopupLyt
${pop_up_message}               id=framePopupLyt
${search_input_field}           id=searchText
${search_input_field2}          xpath=(//*[@resource-id='com.akakce.akakce:id/searchTextView'])[2]
${first_product}                xpath=(//*[@resource-id='com.akakce.akakce:id/cellContainer'])[1]
${ürüne_git_button}             id=detailBtnTextView
${takip_et_button}              xpath=//*[@text='Takip Et']
${login_button}                 xpath=//*[@text='Giriş Yap']
#${login_button}                id=login_btn
${hesap_olustur}                xpath=//*[@text='Hesap Oluştur']
#${hesap_olustur}               id=register_btn
${register_name_input_field}    id=name_edt
${register_surname_input_field}  id=surname_edt
${register_email_input_field}   xpath=(//*[@resource-id='com.akakce.akakce:id/email_edt'])[2]
${register_email2_input_field}  id=email_ag_edt
${register_password_input_field}   xpath=(//*[@resource-id='com.akakce.akakce:id/password_edt'])[2]
${register_password2_input_field}  id=password_ag_edt
${user_icon}                        id=rightIcon

*** Keywords ***
Open Akakce Application
  Open Application
  ...  remote_url=http://localhost:4723
  ...  platformName=Android
  ...  platformVersion=11.0
  ...  deviceName=emulator
  ...  appPackage=com.akakce.akakce
  ...  appActivity=com.akakce.akakce.ui.splash.SplashActivity
  ...  automationName=Uiautomator2

Close Pop Up Message
  Wait Until Page Contains Element      ${pop_up_message}  timeout=15
  Click Element                         ${pop_up_message}

Type Bilgisayar In The Search Box And Click Enter
  Wait Until Page Contains Element      ${search_input_field}
  Click Element                         ${search_input_field}
  Wait Until Page Contains Element      ${search_input_field2}
  Input Text                            ${search_input_field2}  Bilgisayar
  Press Keycode    66

Select First Product
  Wait Until Page Contains Element      ${first_product}
  Click Element                         ${first_product}

Go To Selected Product
  Wait Until Page Contains Element      ${ürüne_git_button}
  Click Element                         ${ürüne_git_button}

Scroll To Takip Et Button
  ${isTakipEtButtonDisplayed}  Run Keyword And Return Status  Element Should Be Visible      ${takip_et_button}
  WHILE    "${isTakipEtButtonDisplayed}" == "False"
       Swipe By Percent    50    80    50    20
       ${isTakipEtButtonDisplayed}  Run Keyword And Return Status  Element Should Be Visible  ${takip_et_button}
  END
  Click Element    ${takip_et_button}
  Sleep    3

Click On Takip Et Button
  Click Element    ${takip_et_button}

Verify Login Page Displayed
  Wait Until Page Contains Element  ${login_button}

Click On Hesap Olustur Button
  Wait Until Page Contains Element      ${hesap_olustur}
  Click Element                         ${hesap_olustur}

Click On User Icon
  Wait Until Page Contains Element    ${user_icon}
  Click Element    ${user_icon}

Enter Register Details
  Wait Until Page Contains Element    ${register_name_input_field}
  Input Text    ${register_name_input_field}    John
  Input Text    ${register_surname_input_field}     Wick
  Input Text    ${register_email_input_field}       j_wick123@example.com
  Input Text    ${register_email2_input_field}      j_wick123@example.com
  Input Text    ${register_password_input_field}    Johnwick123!.
  Input Text    ${register_password2_input_field}   Johnwick123!.
  Sleep    5