*** Settings ***
Library     Selenium2Library

*** Variables ***
${url}  http://localhost:8081/cov/
${Browser}  chrome

*** Test Cases ***
1. Open Website
    Open Browser  ${url}  ${Browser}
    Maximize Browser Window
    Set Selenium Speed  0.3

2. open dashboard
    click link  //*[@id="navbarNav"]/ul/li[1]/a
    Set Selenium Speed  0.9

3. check the page
    title should be  Covid Dashboard

4. open myth
    click link  xpath://*[@id="navbarNav"]/ul/li[2]/a
    Set Selenium Speed  0.9

5. check the page
    title should be  Covid Dashboard

6. open facts
    click link  xpath://*[@id="navbarNav"]/ul/li[3]/a
    sleep   2

7. check the page
    title should be  Covid Dashboard

8. open Login
    click link  xpath://*[@id="navbarNav"]/ul/li[4]/a

9. clear the value
    Input Text  name:email  test@gmail.com
    sleep   5
    Clear Element Text  xpath://*[@id="Email"]

10. check Login
        Input Text  name:email  vineelamvmp@gmail.com
        Input Text  name:password   book22
        click element  xpath://*[@id="login"]

11. check the page
        title should be  Covid Dashboard

12. add myth
        click element  xpath://*[@id="myth"]

13. check page
        title should be  Covid Dashboard

14. enter data check
        Input Text  name:mythname   covidisgood
        Input Text  name:mythdes    nothing
        sleep   5
        Clear Element Text  xpath://*[@id="mythname"]
        Clear Element Text  xpath://*[@id="mythdes"]

15. go back
        click element  xpath://*[@id="bac"]

16. add myth
        click element  xpath://*[@id="myth"]

17. add data
        Input Text  name:mythname  vaccinecausessideeffcts
        Input Text  name:mythdes  mightcausefever
        click element  xpath://*[@id="subm"]
        click link  xpath://*[@id="navbarNav"]/ul/li[1]/a

18. add facts
        click element  xpath://*[@id="fact"]

19. enter data
        Input Text  name:factname  covidcasesareincreasing
        Input Text  name:factdes  wearmasktocontrol
        click element  xpath://*[@id="submi"]

20. Logout
        click link  xpath://*[@id="navbarNav"]/ul/li[4]/a

21. close Browser
        Close Browser 