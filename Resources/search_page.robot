*** Settings ***
Library  AppiumLibrary
Resource    common.robot

*** Variables ***
${search_input_field}                       id=searchText
${search_input_field2}                      xpath=(//*[@resource-id='com.akakce.akakce:id/searchTextView'])[2]
${first_product}                            xpath=(//*[@resource-id='com.akakce.akakce:id/cellContainer'])[1]
${ürüne_git_button}                         id=detailBtnTextView
${takip_et_button}                          xpath=//*[@text='Takip Et']

*** Keywords ***
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
  Scroll To Element    ${takip_et_button}

Click On Takip Et Button
  Click Element    ${takip_et_button}
