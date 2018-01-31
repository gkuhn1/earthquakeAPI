### Welcome to California

California is famous not only for its booming tech economy, controversial film industry, and yearlong summers, but due to its position on both the Pacific and North America plates, it experiences approximately 10,000 earthquakes each year. U.S. Geological Survey (USGS) provides near real time data and information and earth observations so that policy makers and the public have the understanding they need to enhance precedence, response and resilience.

You can find data of all earthquakes for the past 30 days [here](http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.csv)

Using the CSV above, write a Ruby program to find the **first** 10 cities and states with an earthquake that was felt in Los Angeles in a given date range. For the sake of _over_ simplicity, let's assume a linear relationship between the magnitude of an earthquake and the distance it travels before it can be felt. Let's assume a magnitude-5 earthquake can be felt at up to a distance of 500 miles, magnitude-4 quake to 400 miles, magnitude-3 quake to 300 miles and so on. Given the coordinates of Los Angeles at 34.0522° N and 118.2437° W, use the [Haversine Formula](https://en.wikipedia.org/wiki/Haversine_formula) (below) to determine the distance of the earthquakes from Los Angeles (in miles).

```
a = sin²(Δφ/2) + cos φ1 ⋅ cos φ2 ⋅ sin²(Δλ/2)
c = 2 ⋅ atan2( sqrt(a), sqrt(1−a) )
d = R ⋅ c
         
where:   φ is latitude, 
         λ is longitude, 
         R is earth’s radius (mean radius = 3959mi); 
         note that angles need to be in radians to pass to trig functions
```

Your program should accept a start and end date from the user, defaulting to today and 30 days ago. The output should display the time, place (city and state), magnitude, and distance from Los Angeles of the earthquakes.

What are we looking for in an _ideal_ candidate? :octocat:
- We are looking for a working Ruby **or** RoR app.
- Include instructions on how to setup your application: data migrations, rake tasks etc. README are great!
- Keep in mind that the data is updated on a regular basis [here](https://earthquake.usgs.gov/earthquakes/feed/v1.0/csv.php). How would you handle this?
- We like tests!
- We love easy to read and debug code (think modularization :thinking:).
- Be open to discuss your design approach.