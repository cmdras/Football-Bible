# Football Bible
##### Chris Ras, Studentnumber: 10689958
##### Pset 6, Native App Studio 2016

<img src="https://github.com/cmdras/Football-Bible/blob/master/docs/screen1.png" alt="alt text" width="165" height="300"> <img src="https://github.com/cmdras/Football-Bible/blob/master/docs/screen2.png" alt="alt text" width="165" height="300"> <img src="https://github.com/cmdras/Football-Bible/blob/master/docs/screen3.png" alt="alt text" width="165" height="300">


In the Football Bible app, the user can add their favorite teams on their My Teams List. The user can then look up team information on of that team, such as the players that play in the team and who their next opponent is

The first time the user opens the app, the user will have to register an account. When registered, the user will be presented an empty list. If the user presses the plus sign, a list of leagues will be presented. Pressing one of those leagues will present a list of all the teams that play in that league. If the user presses one of those teams, that team will be added to the users personal list. By pressing on a team in the My Teams screen, the user will be presented a screen with that teams players, their next match, and at what time that match is played.

This app uses the Firebase platform for user authentication and for storing that user's personal team list. The football-data.org API is used to retrieve the team information. To make HTTP requests, the AlamoFire library is used, and to parse the resulting JSON the SwiftlyJSON library is used.
Furthermore, many tutorials on https://www.raywenderlich.com were used to understand and apply the Firebase platform.

##### Future Ideas
An issue I ran into was that the API stores the team crest images as SVG files. I could not implement a way to display these images in the app, so in the future I would like to attempt this again. Another addition could be that the user could search for the teams with a search bar. This seems challenging, as the API stores the teams by ID's instead of by name.
