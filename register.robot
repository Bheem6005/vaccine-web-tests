*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${home_url}  https://vaccine-haven.herokuapp.com/

*** Test Cases ***
RegistrationTest
    open browser     ${home_url}        chrome
    click element    id:register__link
    input text       id:citizen_id      9621054600544
    input text       id:name            Bheem
    input text       id:surname         Suttipong
    input text       id:birth_date      04/04/2001
    input text       id:occupation      Student
    input text       id:phone_number    0944444444
    input text       id:address         Home
    click button     id:register__btn
    wait until location is    ${home_url}
    close browser

*** Keywords ***
