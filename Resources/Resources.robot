*** Settings ***
Library    AppiumLibrary
Library    ../Libraries/StringGenerator.py
Variables    ../Data/user_details.yaml

*** Variables ***
${pop_up_message}                           id=framePopupLyt
${search_input_field}                       id=searchText
${search_input_field2}                      xpath=(//*[@resource-id='com.akakce.akakce:id/searchTextView'])[2]
${first_product}                            xpath=(//*[@resource-id='com.akakce.akakce:id/cellContainer'])[1]
${ürüne_git_button}                         id=detailBtnTextView
${takip_et_button}                          xpath=//*[@text='Takip Et']
${login_button}                             id=login_btn
${login_hesap_olustur}                      id=register_btn
${register_name_input_field}                id=name_edt
${register_surname_input_field}             id=surname_edt
${register_email_input_field}               xpath=(//*[@resource-id='com.akakce.akakce:id/email_edt'])[2]
${register_email2_input_field}              id=email_ag_edt
${register_password_input_field}            xpath=(//*[@resource-id='com.akakce.akakce:id/password_edt'])[2]
${register_password2_input_field}           id=password_ag_edt
${user_icon}                                id=rightIcon
${register_accept_terms_and_conditions}     id=privacyCheck
${register_button}                          xpath=(//*[@resource-id='com.akakce.akakce:id/register_btn'])[1]
${login_username_input_field}               id=email_edt
${login_password_input_field}               id=password_edt

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

Scroll To Element
  [Arguments]    ${element}
  ${isElementVisible}  Run Keyword And Return Status  Element Should Be Visible      ${element}
  WHILE    "${isElementVisible}" == "False"
       Swipe By Percent    50    80    50    30
       ${isElementVisible}  Run Keyword And Return Status  Element Should Be Visible  ${element}
  END

Scroll To Takip Et Button
  Scroll To Element    ${takip_et_button}

Click On Takip Et Button
  Click Element    ${takip_et_button}

Verify Login Page Displayed
  Wait Until Page Contains Element  ${login_button}

Click On Hesap Olustur Button
  Wait Until Page Contains Element      ${login_hesap_olustur}
  Click Element                         ${login_hesap_olustur}

Click On User Icon
  Wait Until Page Contains Element    ${user_icon}
  Click Element    ${user_icon}

Set Register Values
  ${register_user_name}  Generate Name
  ${register_user_surname}  Generate Surname
  ${register_user_email}  Generate Email
  ${register_user_password}  Generate Password
  Set Test Variable    ${register_user_name}
  Set Test Variable    ${register_user_surname}
  Set Test Variable    ${register_user_email}
  Set Test Variable    ${register_user_password}

Enter Register Details
  Set Register Values
  Wait Until Page Contains Element    ${register_name_input_field}
  Input Text    ${register_name_input_field}        ${register_user_name}
  Input Text    ${register_surname_input_field}     ${register_user_surname}
  Input Text    ${register_email_input_field}       ${register_user_email}
  Input Text    ${register_email2_input_field}      ${register_user_email}
  Input Text    ${register_password_input_field}    ${register_user_password}
  Input Text    ${register_password2_input_field}   ${register_user_password}

Accept Terms And Conditions
  Scroll To Element     ${register_accept_terms_and_conditions}
  Click Element         ${register_accept_terms_and_conditions}

Click On Register Button
  Wait Until Page Contains Element      ${register_button}
  Click Element                         ${register_button}

Verify New User Is Created
  Wait Until Page Contains    Profilim
  Log To Console    Name and Surname = ${register_user_name} ${register_user_surname}
  Wait Until Page Contains    ${register_user_name} ${register_user_surname}

Enter Standard User Login Credentials
  Log To Console    Name and Surname = ${standard_user2.name} ${standard_user2.surname}
  Input Text    ${login_username_input_field}       ${standard_user2.email}
  Input Text    ${login_password_input_field}       ${standard_user2.password}

Click On Login Button
  Wait Until Page Contains Element    ${login_button}
  Click Element    ${login_button}

Verify User Is Logged In
  Wait Until Page Contains    Profilim
  Log To Console    Name and Surname = ${standard_user1.name} ${standard_user1.surname}
  Wait Until Page Contains    ${standard_user1.name} ${standard_user1.surname}