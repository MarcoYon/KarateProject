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