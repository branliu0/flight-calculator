# Data Sources

## Open Flights

Main data source, including IATA code, name, city, country, latitude, longitude.
However, doesn't include traffic data, and we don't want to include all 9000+
IATA airports, so we need another data source to select just the top 1000-1500
airports by traffic, or else the data payload becomes unnecessarily large.

https://openflights.org/data.html

## Aviation Fanatic

Another database of aviation data, including estimated passenger traffic for
airports. However, the data is not easily downloadable. But we can download a
KML file, which contains ICAO codes (not IATA codes!) which we can use to
cross-reference with the Open Flights dataset.

1946 airports with estimated passenger data:
https://www.aviationfanatic.com/ent_list.php?ent=7&NN_AP_Passengers=1&so=22

KML download link: https://www.aviationfanatic.com/ent_kml.php?ent=7&NN_AP_Passengers=1&so=22

All airports: https://www.aviationfanatic.com/ent_list.php?ent=7

## Airport 1K

Old dataset, source unknown. Includes traffic ranking but is missing some
important airports, such as Incheon (Seoul, South Korea), which makes it
unusable.

# Data Processing

```
./process-airport-data.rb
```

1. Import Open Flights and Aviation Fanatic data
2. Filter out airports that don't have an IATA code or passenger traffic estimates
3. Select a subset of relevant fields
4. Output a JSONP file (so that the data can be imported via Javascript without
   any CORS issues.)
