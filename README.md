rdtrip
======

This is a project put together in two weeks for Hungry Academy. The purpose was to integrate two technologies, two integrations, and one LivingSocial vertical. To fulfill that, I used:

* [Raphael.js](http://raphaeljs.com/) - for plotting escapes on a world map
* [Last.fm](http://www.last.fm/) - to pull unique and popular playlists
* [LinkedIn](http://www.linkedin.com/) - for OAuth
* [Rdio](http://www.rdio.com/) - to create playlists
* [Escapes](http://livingsocial.com/escapes)

Each escape is mapped (using [geocoder](http://rubygeocoder.com/)) to a last.fm metro (listed [here](http://www.last.fm/api/show/geo.getMetros)). For each metro, I pull [unique](http://www.last.fm/api/show/geo.getMetroUniqueTrackChart) and [popular](http://www.last.fm/api/show/geo.getMetroHypeTrackChart) songs, then take the top unique song and create a playlist from it.

The project lives at [http://rdtrip.in](http://rdtrip.in "rdtrip.in")