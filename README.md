
# GeoArt

### Overview

GeoArt is a iOS app that was made for Steelhacks 2019. The project won second place.

The app uses a devices's location to create a unique piece of art. It does this by processing each digit of the devices's longitude and latitude as different parameters. 
For example, one digit may represent one shape's size, while another may represent the blue component of the piece's background color. The nature of the algorithm ensures that each piece of art is unique to its longitude and latitude. Additionally, since locations that are close together share many of the greater digits of latitude and longitude, the generated pieces of art for locations that are nearby each other - while still unique - should share resemblance proportional to how nearby they are.

Here are two examples of pieces of art from completely separate areas of the world:

Japan: 

![Japan](https://i.imgur.com/TFINM6J.png)

Brazil:

![Brazil](https://i.imgur.com/bzttzeC.png)

If this project were done over a timespan longer than a weekend, more time could have been spent on attemping other, more interesting components of an art piece to generate, rather than just simple polygons and colors.

### Application

There are a couple practical applications we had in mind for this app. 

For one, it would be very cool to have one's background set to the artwork corresponding to their current location. Their phone's background would change as the user went about their daily life, and the user would begin to associate places with specific pieces of art. Seeing what piece of art awaits them could be added to list of excitements involved in a user's traveling to a new place.

Some other folks who have seen this project have also noted how it could be used for security purposes or proof of location purposes. Having obtained and saved a specific piece of art could prove to somebody that the user was in a certain location that they were supposed to be in.
