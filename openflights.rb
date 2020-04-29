#!/usr/bin/env ruby

require 'csv'

OPEN_FLIGHTS = "airports-openflights.csv"
AIRPORT1K = "airport1k-original.csv"


top_airport_codes = CSV::read(AIRPORT1K).map { |d| d[0] }

headers = %i(id name city country iata icao lat long alt timezone dst tz type source)
data = CSV::read(OPEN_FLIGHTS, headers: headers)
    .filter { |d| top_airport_codes.include? d[:iata] }
    .sort_by { |d| top_airport_codes.index(d[:iata]) }

CSV.generate do |csv|
    data.each do |d|
        csv << [
            d[:iata],
            d[:name],
            d[:lat].to_f.round(4),
            d[:long].to_f.round(4)
        ]
    end
end.tap { |x| puts x }