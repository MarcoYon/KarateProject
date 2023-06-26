@RegresionArticle @GeneralTest
Feature: Test for Articles page


  Background: Define URL
    Given url 'https://conduit.productionready.io/api/'

  @Articles_01
  Scenario: Creacion de un nuevo articulo
    Given path 'users/login'
    And request { "user" : { "email" : "karateudemy2023@test.com", "password" : "karateudemy" } }
    When method Post
    Then status 200
    * def token = response.user.token

    Given header Authorization = "Token " + token
    Given path "articles"
    And request { "article": {"tagList": [],"title": "New article 08", "description": "descripción article", "body": "cuerpo article" } }
    When method Post
    Then status 200
    And match response.article.title == "New article 08"

  #---------------------------------------------------------------------------------------------------------------------
  #--------------------------------------------------- DELETE ----------------------------------------------------------
  #---------------------------------------------------------------------------------------------------------------------

  @Articles_02
  Scenario: Creacion de un nuevo articulo y Eliminacion
    * def tokenResponse = callonce read("classpath:Helpers/CreateToken.feature") { "email" : "karateudemy2023@test.com", "password" : "karateudemy" }
    * def token = tokenResponse.authToken

    #CREATE A NEW ARTICLE
    Given header Authorization = "Token " + token
    Given path "articles"
    And request { "article": {"tagList": [],"title": "Delete article 09", "description": "descripción article", "body": "cuerpo article" } }
    When method Post
    Then status 200
    * def articleId = response.article.slug

    #VALIDATE ARTICLE
    Given params { limit : 10, offset : 0 }
    Given path 'articles'
    When method Get
    Then status 200
    #And match response.articles[0].title == "Delete article 09"

    #DELETE ARTICLE
    Given header Authorization = "Token " + token
    Given path "articles", articleId
    When method Delete
    Then status 204

    #VALIDATE ARTICLE AFTER DELETE
    Given params { limit : 10, offset : 0 }
    Given path 'articles'
    When method Get
    Then status 200
    #And match response.articles[0].title != "Delete article 09"