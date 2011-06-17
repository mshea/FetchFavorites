Title: Fetch Favorites 
Author: Mike Shea
Date: 4 June 2011

# Fetch Favorites #

## About ##

This program reaches out to Twitter and pulls back .json data for a set of specific Favorites urls. It then stores these data in the database and exports the results to CSV files for manipulation in excel.

## To Do ##

* Tie URL table to favorites table.
* Set up a view that returns an HTML clip of all favorites from one source through a source ID.
* Output dates in a format Excel can deal with
* Link URLs in the tweet
* Build some tests.
* Export the whole thing to a server somewhere.

## Done ##

* Set up a cronjob to do the fetching regularly
* Build favorites URL section so we can track multiple favorites.
* Build the CSV export
* Turn date strings into proper datetime objects.
* Capture "place" correctly
* Capture coordinates correctly
* Show profile pic on "show" page
* Display location on a map
* Link coordinates to Google Maps
* Verify that we're getting all the right data.
