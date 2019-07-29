@Smoke
Feature: End to end example

  Scenario: CRUD Playlist using different terminals
    # PREREQUISITES
    Given I uninstall Spotify desktop application
    And I clear all Spotify desktop application cache files
    And I clear any Spotify desktop application installer from my Downloads folder
    And I clear user's playlists using Spotify API
    And I download Spotify desktop application installer from Spotify website
    And I should have Spotify installation file in my Downloads folder in less than 30 seconds
    And I install Spotify desktop application on my computer
    #################################
    ###### CREATE ###################
    #################################
    # STEP : Create playlist in desktop application
    When I log into Spotify desktop application using credentials
      | email | password |
      |       |          |
    And I create new playlist using Spotify desktop application with details
      | name         | description                                     | public |
      | E2E Playlist | A sample playlist for automated end to end test | true   |
    # STEP : verify playlist is present with an API request
    And I send read current user's playlist request using Spotify API
    Then I should see playlist in API response list with details
      | name         | description                                     | public |
      | E2E Playlist | A sample playlist for automated end to end test | true   |
    #################################
    ###### READ ###################
    #################################
    When I send read playlist request using Spotify API with playlistId from scenario
    Then I should see playlist as API response with details
      | name         | description                                     | public |
      | E2E Playlist | A sample playlist for automated end to end test | true   |
    When I open Spotify android application
    And I log into Spotify android application using credentials
      | email | password |
      |       |          |
    Then I can find user's playlist in Spotify android application with details
      | name         | description                                     | public |
      | E2E Playlist | A sample playlist for automated end to end test | true   |