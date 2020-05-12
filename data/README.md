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

## 2014 Greenhouse Gas Emissions per capita (World Resources Institute)

Although you can find strictly CO2 emissions for 2018, it seems that greenhouse
gas emissions (which includes non-CO2 gases such as methane, nitrous oxide,
etc.) is only available up to 2014. GHG emissions appear to be about 32% higher
than looking at only CO2 emissions. (But note: with CO2 emissions it's still
unclear to me whether they're calculated only from fuel combustion or whether
they include other sources of CO2 as well, such as concrete production).

Here we choose to use GHG emissions excluding land use change and forestry,
because including it causes some countries' GHG emissions to become negative,
which doesn't seem to be the right thing we're going for.

http://cait.wri.org/historical/export/Country%20GHG%20Emissions/WorldResourcesInstituteCAIT.csv?&keyField=Country&unit=People&unit=tCO2e%20Per%20Capita&indicator[]=Population&indicator[]=Total%20GHG%20Emissions%20Excluding%20Land-Use%20Change%20and%20Forestry%20Per%20Capita&year[]=2014&sortDir=desc&chartType=geo

## 2014 Greenhouse Gas Emissions for Eritrea

WRI dataset does not include emissions data for Eritrea, Niue, and Cook Islands.
We manually add the data for Eritrea since it had a population of 3.3 million in
2014.

https://www.macrotrends.net/countries/ERI/eritrea/ghg-greenhouse-gas-emissions
https://www.populationpyramid.net/eritrea/2014/

# Data Processing

```
./process-airport-data.rb
```

1. Import Open Flights and Aviation Fanatic data
2. Filter out airports that don't have an IATA code or passenger traffic estimates
3. Select a subset of relevant fields
4. Output a JSONP file (so that the data can be imported via Javascript without
   any CORS issues.)
