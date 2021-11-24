*** Settings ***
Library  SeleniumLibrary

*** Variables ***


*** Test Cases ***
RegistrationTest
    create webdriver    Chrome  executable_path"./chromedriver.exe"
    open browser    https://vaccine-haven.herokuapp.com/    chrome
    click element   xpath://text[contains(text(),'Register')]
    click link  xpath://*[@id="dropdown"]/ul/li[1]/a
    input text  name:citizen_id     1104444444444
    input text  name:name   Bheem
    input text  name:surname   Suttipong
    input text  name:birth_date   04/04/2001
    input text  name:occupation     Student
    input text  name:phone_number   0944444444
    input text  name:address    Home
    click element   xpath://button[contains(text(),'Next')]
    close browser

*** Keywords ***
