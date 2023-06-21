Feature: Test for Home page


  Background: Define URL
    Given url 'https://conduit.productionready.io/api/'

  #----------------------------------------------------------
  #Ejemplo utilizando BACKGROUND

  Scenario: Get all tabs - path tags
    Given params { limit : 10, offset : 0}
    Given path 'tags'
    When method Get
    Then status 200

  Scenario: Get 10 articles from the page - path articles
    Given params { limit : 10, offset : 0}
    Given path 'articles'
    When method Get
    Then status 200


  #----------------------------------------------------------
  #Ejemplo principal

  Scenario: Get all tabs
    Given url 'https://conduit.productionready.io/api/tags'
    When method Get
    Then status 200

  Scenario: Get 10 articles from the page
    Given url 'https://conduit.productionready.io/api/articles?limit=10&offset=0'
    Given url 'https://conduit.productionready.io/api/articles'
    When method Get
    Then status 200

  Scenario: Get 10 articles from the page
    #Given param limit = 10   // query parametros por separados uno por linea
    #Given param offset = 0   // query parametros por separados uno por linea
    Given params { limit : 10, offset : 0}
    #Given url 'https://conduit.productionready.io/api/articles?limit=10&offset=0' // se puede separar los query parametros
    Given url 'https://conduit.productionready.io/api/articles'
    When method Get
    Then status 200

  #----------------------------------------------------------
  # Ejemplo utilizando PATH

  Scenario: Get all tabs - path tags
    Given params { limit : 10, offset : 0}
    Given url 'https://conduit.productionready.io/api/'
    Given path 'tags'
    When method Get
    Then status 200

  Scenario: Get 10 articles from the page - path articles
    Given params { limit : 10, offset : 0}
    Given url 'https://conduit.productionready.io/api/'
    Given path 'articles'
    When method Get
    Then status 200


