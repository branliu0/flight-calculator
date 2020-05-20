# Flight Calculator

**Why another flight calculator?** Yes, there are innumerable flight calculators
in existence. The main motivation for this flight calculator is to represent the
environmental impact of aviation not only in terms of emissions, but in ways
that are more relatable. For instance, many people already carpool and avoid
meat for environmental reasons. How do those behaviors compare to avoiding
flying?

This flight calculator is also **open source** so that any interested group can
adapt it and put it on their website. Let us know if you do!

We document our data sources and share our code for processing data.

# Sources

## Airports
Airport name, city, country, latitude, longitude: https://openflights.org/data.html

Airport estimated passenger volume: https://www.aviationfanatic.com/ent_list.php?ent=7&NN_AP_Passengers=1&so=22

## Calculating Distance
We use the great-circle distance: https://en.wikipedia.org/wiki/Great-circle_distance

The UK government (in 2018) recommends adding 8% to the great-circle distance to account for indirect flight paths and delays: https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/726911/2018_methodology_paper_FINAL_v01-00.pdf

## Flying Emissions
The average carbon intensity from passenger aviation in 2018 was 88g CO2/revenue-passenger-kilometer: https://theicct.org/sites/default/files/publications/ICCT_CO2-commercl-aviation-2018_20190918.pdf

To account for the non-CO2 climate effects of aviation,  the UK Government (in 2018) recommends applying a multiplier of 1.9: https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/726911/2018_methodology_paper_FINAL_v01-00.pdf

A detailed scientific paper from 2010 on the climate effects of aviation supports an estimated multiplier of 1.9, but this excludes the effects of cirrus cloud formation, which is still not well understood: https://www.sciencedirect.com/science/article/pii/S1352231009004956

## Vegetarianism
A 2015 systematic review of 49 studies of the climate impact of diet change finds an average impact of 540 kg CO2e/year reduction of becoming vegetarian:
https://www.sciencedirect.com/science/article/pii/S0959652614012931

## Carpooling
This figure was manually estimated.

According to the US Census (2018), the average one-way commute time is 27.1 minutes: https://data.census.gov/cedsci/all?q=Commuting&hidePreview=false&t=Commuting&tid=ACSST1Y2018.S0801

We take this to be approximately a 20-mile round-trip commute.

According to the EPA, the average car’s fuel economy in the US is 22.3mpg and each gallon of gasoline causes 9 kg CO2e of emissions: https://www.epa.gov/energy/greenhouse-gases-equivalencies-calculator-calculations-and-references

Using these figures, and assuming one switches from driving alone to carpooling with one other person for all 252 working days of the year, we find an estimated reduction of 1017 kg CO2e/year.

## Per Capita Greenhouse Gas Emissions by Country
Note that while we have data for per capita CO2 emissions up to 2018, we only have per capita greenhouse gas emissions (which accounts for non-CO2 gases) up to 2014: http://cait.wri.org/historical/Country%20GHG%20Emissions?indicator[]=Population&indicator[]=Total%20GHG%20Emissions%20Excluding%20Land-Use%20Change%20and%20Forestry%20Per%20Capita&indicator[]=Total%20CO2%20Emissions%20Excluding%20Land-Use%20Change%20and%20Forestry%20Per%20Capita&indicator[]=Total%20GHG%20Emissions%20Including%20Land-Use%20Change%20and%20Forestry%20Per%20Capita&year[]=2014&sortIdx=NaN&sortDir=asc&chartType=geo

## Eurostar Emission Intensity
Eurostar states they produce 6g CO2e per passenger-kilometer: https://help.eurostar.com/faq/uk-en/question/What-is-the-Co2-emission-factor-per-kilometer-when-using-Eurostar

## Arctic Sea Ice
Each metric ton of CO2 is associated with a sustained loss of 3 square meters of Arctic sea ice: https://science.sciencemag.org/content/354/6313/747.full
