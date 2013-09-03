Feature: Haml templating
  In order to save my fingers and keyboard
  As a programmer building single-page apps
  I want to be able to write my static pages in Haml instead of HTML

  Scenario: Create an HTML file from a Haml template
    Given a file named "template.haml" with:
      """
      !!!
      %html
      """
    When  I run a haml task on "template.haml"
    Then  a file named "template.html" should exist
    And   the file "template.html" should contain:
      """
      <!DOCTYPE html>
      <html></html>
      """

  Scenario: Create any required output directories for storing Haml output
    Given an empty file named "src/views/template.haml"
    When  I run a haml task on "src/views/template.haml" with output to "static/pages"
    Then  a directory named "static/pages" should exist
    And   a file named "static/pages/template.html" should exist
