
  Feature: Create Token

    Scenario: Creacion de Token
      Given url 'https://conduit.productionready.io/api/'
      Given path 'users/login'
      #And request { "user" : { "email" : "karateudemy2023@test.com", "password" : "karateudemy" } }
      And request { "user" : { "email" : "#(email)", "password" : "#(password)" } }
      When method Post
      Then status 200
      * def authToken = response.user.token