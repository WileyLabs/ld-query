Feature: select values using query syntax
  As a developer working with JSON-LD
  I want to be able to use familiar syntax to query a JSON-LD document
  So that I don't need to manually parse the expanded JSON tree
  
  Background: Load sample data
    Given the sample data containing favourite reads is loaded
    And I construct an ldQuery object using <context>
        | context                                                                                                   |
        | { "so": "http://schema.org/", "foaf": "http://xmlns.com/foaf/0.1/", "ex": "http://www.example.org#" } |
    
    Scenario: Query for the first name node
      When I query for "foaf:firstName"
      Then the result should be a QueryNode object
      
    Scenario: Query for first name values
      When I query for "foaf:firstName @value"
      Then the result should be "Andrew"
    
    Scenario: Query for description value
      When I query for "so:description @value"
      Then the result should be "Linked person"
    
    Scenario: Query for the first value
      When I query for "@value"
      Then the result should be "goofballLogic"
      
    Scenario: Query for a property which isn't present on every branch of the tree
      When I query for "ex:note-to-self @value"
      Then the result should be "Need to finish reading this"
      