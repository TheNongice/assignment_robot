*** Settings ***
Library    SeleniumLibrary
Test Teardown    Close All Browsers
Resource    ./resources/variable.resource
Resource    ./resources/keyword.resource

*** Test Cases ***
Verify registration form with all input field
    [Tags]    Happy Case
    Open Browser CU Hotel

    Input Firstname    ${NAME}
    Input Lastname     ${LNAME}
    Input Email        ${EMAIL}
    Input Telephone    ${TELPHONE}
    Input Notes        test this is our note
    Input Amount People    3

    Click "Yes" Pet
    Click I accepted term
    
    Click Submit

    Check Firstname is       'valid'
    Check Lastname is        'valid'
    Check Telephone is       'valid'
    Check Email is           'valid'
    Check Number of Adults is    'valid'

    Sleep    1
    Check Accept Terms is    'valid'

Required Firstname to submit
    [Tags]    Bad Case
    Open Browser CU Hotel

    Input Lastname     ${LNAME}
    Input Email        ${EMAIL}
    Input Telephone    ${TELPHONE}
    Input Notes        ${NONE}
    Input Amount People    3

    Click "Yes" Pet
    Click I accepted term

    Click Submit

    Check Firstname is    'invalid'
    Check Lastname is     'valid'
    Check Telephone is    'valid'
    Check Email is        'valid'
    Check Number of Adults is    'valid'

Required Lastname to submit
    [Tags]    Bad Case
    Open Browser CU Hotel
    Input Firstname    ${NAME}
    Input Email        ${EMAIL}
    Input Telephone    ${TELPHONE}
    Input Notes        ${NONE}
    Input Amount People    3

    Click "Yes" Pet
    Click I accepted term

    Click Submit

    Check Firstname is    'valid'
    Check Lastname is     'invalid'
    Check Telephone is    'valid'
    Check Email is        'valid'
    Check Number of Adults is    'valid'

Required Telephone to submit
    [Tags]    Bad Case
    Open Browser CU Hotel
    Input Firstname    ${NAME}
    Input Lastname     ${LNAME}
    Input Email        ${EMAIL}
    Input Notes        ${NONE}
    Input Amount People    3

    Click "Yes" Pet
    Click I accepted term

    Click Submit

    Check Firstname is    'valid'
    Check Lastname is     'valid'
    Check Telephone is    'invalid'
    Check Email is        'valid'
    Check Number of Adults is    'valid'

Required Email to submit
    [Tags]    Bad Case
    Open Browser CU Hotel
    Input Firstname    ${NAME}
    Input Lastname     ${LNAME}
    Input Telephone    ${TELPHONE}
    Input Notes        ${NONE}
    Input Amount People    3

    Click "Yes" Pet
    Click I accepted term

    Click Submit

    Check Firstname is    'valid'
    Check Lastname is     'valid'
    Check Telephone is    'valid'
    Check Email is        'invalid'
    Check Number of Adults is    'valid'

Required Filled Number of Adults to submit
    [Tags]    Bad Case
    Open Browser CU Hotel
    Input Firstname    ${NAME}
    Input Lastname     ${LNAME}
    Input Email        ${EMAIL}
    Input Telephone    ${TELPHONE}
    Input Notes        ${NONE}

    Click "Yes" Pet
    Click I accepted term
    Click Submit
    
    Check Firstname is    'valid'
    Check Lastname is     'valid'
    Check Telephone is    'valid'
    Check Email is        'valid'
    Check Number of Adults is    'invalid'

Required Pressed Accepted Terms to submit
    [Tags]    Bad Case
    Open Browser CU Hotel
    Input Firstname    ${NAME}
    Input Lastname     ${LNAME}
    Input Email        ${EMAIL}
    Input Telephone    ${TELPHONE}
    Input Notes        ${NONE}
    Input Amount People    3

    Click "Yes" Pet
    
    Click Submit
    Check Firstname is    'valid'
    Check Lastname is     'valid'
    Check Telephone is    'valid'
    Check Email is        'valid'
    Check Number of Adults is    'valid'

    Sleep    1
    Check Accept Terms is    'invalid'