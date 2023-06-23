@RegresionAssertions @GeneralTest
Feature: Test for Home page - Assertions


    Background: Define URL
        Given url 'https://conduit.productionready.io/api/'

    #************************************************************************
    #****************************** TABS ************************************
    #************************************************************************

    Scenario: Get all tabs - Assertion Contains
        Given params { limit : 10, offset : 0}
        Given path 'tags'
        When method Get
        Then status 200
        And match response.tags contains 'et'
        And match response.tags contains ['et', 'welcome', 'ipsum']
        And match response.tags !contains 'cars'
        And match response.tags !contains ['cars', 'moto']
        And match response.tags == "#array"

    Scenario: Get all tabs - Assertion MATCH
        Given params { limit : 10, offset : 0}
        Given path 'tags'
        When method Get
        Then status 200
        And match response.tags == "#array"
        #And match response.tags == "#string"



    #************************************************************************
    #************************** ARTICLES ************************************
    #************************************************************************



    Scenario: Articles con un una matriz de tamaño 10
        Given params { limit : 10, offset : 0 }
        Given path 'articles'
        When method Get
        Then status 200
        And match response.articles == "#[10]"


    Scenario: Cuenta de articulos es igual a ciento noventa y siete
        Given params { limit : 10, offset : 0 }
        Given path 'articles'
        When method Get
        Then status 200
        And match response.articlesCount == 197