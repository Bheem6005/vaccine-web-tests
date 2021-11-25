*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${home_url}             https://vaccine-haven.herokuapp.com/
${citizen_id}           9621054600544
${reservation_link}     id:reserve__link
${info_link}            check_info__link
${site_name}            OGYHSite
${vaccine_name}         Astra

*** Test Cases ***
VerifyItemsTest
   open browser                        ${home_url}    chrome
   wait until page contains element    ${reservation_link}
   wait until page contains element    ${info_link}
   close browser

ReservationTest
    open browser                        ${home_url}                 chrome
    click element                       ${reservation_link}
    input text                          id:citizen_id               ${citizen_id}
    select from list by value           id:site_name                ${site_name}
    select from list by value           id:vaccine_name             ${vaccine_name}
    click button                        id:reserve__btn
    wait until location is              ${home_url}
    click element                       ${info_link}
    input text                          id:citizen_id               ${citizen_id}
    click button                        id:info__btn
    sleep                               2sec
    element text should be              id:reserve_vaccine_value    ${site_name}
    element text should be              id:reserve_site_value       ${vaccine_name}
    close browser

CancelReservationTest
    open browser                        ${home_url}                 chrome
    click element                       ${info_link}
    input text                          id:citizen_id               ${citizen_id}
    click button                        id:info__btn
    sleep                               2sec
    click button                        id:cancel__btn
    wait until location is              https://vaccine-haven.herokuapp.com/info
    close browser

*** Keywords ***
