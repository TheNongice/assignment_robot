*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Resource   variable.resource

*** Keywords ***
Open Browser CU Hotel
    ${is_ci}=    Get Environment Variable    CI    default=False
    IF    '${is_ci}' == 'true'
        Open Browser    ${WEB_URL}     headlesschrome    options=add_argument("--no-sandbox"); add_argument("--disable-dev-shm-usage")
    ELSE
        Open Browser    ${WEB_URL}     chrome
        Maximize Browser Window
    END

    Sleep    5s
    Scroll Element Into View    //*[@class='LWbAav Kv1aVt']
    Scroll Element Into View    //*[@class='JVi7i2 comp-lt33fcq1 wixui-form']

Input Firstname
    [Arguments]    ${name}
    Input Text    //*[@id='input_comp-lt33fcq41']    ${name}
Input Lastname
    [Arguments]    ${lname}
    Input Text    //*[@id='input_comp-lt33fcs1']    ${lname}
Input Email
    [Arguments]    ${mail}
    Input Text    //*[@id='input_comp-lt33fcsf1']    ${mail}
Input Telephone
    [Arguments]    ${tel}
    Input Text    //*[@id='input_comp-lt33fcsi1']    ${tel}
Input Notes
    [Arguments]    ${notes}
    Input Text    //*[@id='input_comp-lt33fct3']    ${notes}

Input Amount People
    [Arguments]    ${amount}
    Scroll Element Into View    //*[@id='collection_comp-lt33fcsl1']
    Click Element    //*[@id='collection_comp-lt33fcsl1']
    Wait Until Element Is Visible    //*[@id='comp-lt33fcsl1-portal-wrapper-id']
    ${index}=    Evaluate    int(${amount}) - 1

    IF    ${index} > 5
        ${index}=    Set Variable    5
    END
    
    Click Element    //*[@id='menuitem-${index}']

Click "Yes" Pet
    SeleniumLibrary.Click Element    //*[@id="comp-ltubl4ab"]/fieldset/div/label[1]/div[1]
Click "No" Pet
    SeleniumLibrary.Click Element    //*[@id="comp-ltubl4ab"]/fieldset/div/label[2]/div[2]

Click I accepted term
    Click Element    //*[@class='cCdhN7']
    Scroll Element Into View    //*[@class='uDW_Qe wixui-button PlZyDq']

Click Submit
    Click Element    //*[@class='uDW_Qe wixui-button PlZyDq']

# Check Textbox Input
Check Firstname is
    [Arguments]    ${state}
    ${state}=    Set Variable If   ${state} == 'valid'    false    true
    Check Textbox Invalid State    ${XPATH_FNAME}            ${state}
Check Lastname is
    [Arguments]    ${state}
    ${state}=    Set Variable If   ${state} == 'valid'    false    true
    Check Textbox Invalid State    ${XPATH_LNAME}            ${state}
Check Email is
    [Arguments]    ${state}
    ${state}=    Set Variable If   ${state} == 'valid'    false    true
    Check Textbox Invalid State    ${XPATH_MAIL}            ${state}
Check Telephone is
    [Arguments]    ${state}
    ${state}=    Set Variable If   ${state} == 'valid'    false    true
    Check Textbox Invalid State    ${XPATH_TEL}             ${state}
Check Number of Adults is
    [Arguments]    ${state}
    ${state}=    Set Variable If   ${state} == 'valid'    false    true
    Check Textbox Invalid State    ${XPATH_ADULTS_NO}       ${state}
Check Accept Terms is
    [Arguments]    ${state}
    ${state}=    Set Variable If   ${state} == 'valid'    false    true
    Check Textbox Invalid State    ${XPATH_ACCEPT_TERMS}    ${state}

# Validator
Check Textbox Invalid State
    [Arguments]    ${xpath}    ${status}
    ${result}=    Get Element Attribute    ${xpath}    aria-invalid
    Should Be Equal    ${result}    ${status}    The result of valid state it's not equal with your expected. (Want: ${status} Got: ${result})
    
