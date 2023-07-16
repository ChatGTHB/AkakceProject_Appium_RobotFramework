*** Settings ***
Library  AppiumLibrary
Library    ../Libraries/StringGenerator.py
Variables    ../Data/user_details.yaml

*** Variables ***
${login_button}                             id=login_btn
${login_hesap_olustur}                      id=register_btn
${register_name_input_field}                id=name_edt
${register_surname_input_field}             id=surname_edt
${register_email_input_field}               xpath=(//*[@resource-id='com.akakce.akakce:id/email_edt'])[2]
${register_email2_input_field}              id=email_ag_edt
${register_password_input_field}            xpath=(//*[@resource-id='com.akakce.akakce:id/password_edt'])[2]
${register_password2_input_field}           id=password_ag_edt
${register_accept_terms_and_conditions}     id=privacyCheck
${register_button}                          xpath=(//*[@resource-id='com.akakce.akakce:id/register_btn'])[1]
${login_username_input_field}               id=email_edt
${login_password_input_field}               id=password_edt

*** Keywords ***
Verify Login Page Displayed
  Wait Until Page Contains Element  ${login_button}

Click On Hesap Olustur Button
  Wait Until Page Contains Element      ${login_hesap_olustur}
  Click Element                         ${login_hesap_olustur}

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
  Log To Console    Name and Surname = ${${user}.name} ${${user}.surname}
  Input Text    ${login_username_input_field}       ${${user}.email}
  Input Text    ${login_password_input_field}       ${${user}.password}

Click On Login Button
  Wait Until Page Contains Element    ${login_button}
  Click Element    ${login_button}

Verify User Is Logged In
  Wait Until Page Contains    Profilim
  Log To Console    Name and Surname = ${standard_user1.name} ${standard_user1.surname}
  Wait Until Page Contains    ${standard_user1.name} ${standard_user1.surname}