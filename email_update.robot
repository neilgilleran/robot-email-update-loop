*** Settings ***
Library			SeleniumLibrary
Library			BuiltIn
Library			OperatingSystem
Library			Dialogs
Library			DateTime
Library			Collections
Library			String
Suite Teardown	Close Browser

*** Variables ***
${LOGIN URL}	https://eu-quercus.elluciancloud.com/app/rcsi/f?p=1001:301:8205114368295::NO:::
${SEARCH URL}   https://eu-quercus.elluciancloud.com/app/rcsi/f?p=1200:107:6637888602659::
${BROWSER}		Chrome
     

#update the following lists with the matching ID's and email addresses
@{eyedees}      12341234
@{eeemails}     1234@rcsi.ie

*** Test Cases ***
Log in user test
    Open Browser    ${LOGIN URL}    ${BROWSER}

    ${username} =   Get Value From User   Input username  hidden=no
    Input Text      id:P101_USERNAME    ${username}
    
    ${password} =   Get Value From User   Input password  hidden=yes    
    Input Text    id:P101_PASSWORD    ${password}
    
    Click Element       name:P101_LOGIN
    
    BuiltIn.Sleep 	2

    Click Element   xpath://*[@id="R27439901205983165"]/div[1]/a/img    
    
    : FOR    ${eyedee}  ${eeemail}    IN ZIP    ${eyedees}    ${eeemails}
    \   log to console      ${eyedee}  stream=STDOUT  
    \   Input Text   xpath://*[@id="P301_SEARCH_TEXT"]   ${eyedee}
    \   Click Element   xpath://*[@id="apex_layout_176308900283848612"]/tbody/tr[1]/td[5]/a
    \   Click Element   xpath://*[@id="report_R34198005227411257"]/tbody/tr[2]/td/table/tbody/tr[2]/td[5]/a/img
    \   Click Element   xpath://*[@id="wwvFlowForm"]/div[2]/div[2]/div[2]/div[2]/ul/li[4]/a
    \   Click Element   xpath://*[@id="apex_layout_47832382907987045"]/tbody/tr/td/a
    \   Input Text   xpath://*[@id="P308_TERM_EMAIL"]   ${eeemail}
    \   Click Element   xpath://*[@id="apex_layout_47832382907987045"]/tbody/tr/td/a[1]
    \   Click Element   xpath://*[@id="wwvFlowForm"]/div[2]/div[2]/div[2]/div[2]/map/div/a[1]
