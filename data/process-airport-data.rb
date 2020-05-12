#!/usr/bin/env ruby

require 'csv'
require 'json'

OPEN_FLIGHTS = "open-flights-7698.csv"
AVIATION_FANATIC = "aviation-fanatic-1946.kml"
OUTPUT = "data-jsonp.js"
NUM_AIRPORTS = 1000

top_airport_icao = File.open(AVIATION_FANATIC)
    .select { |line| line.include? "name" }
    .map { |line| line.match(/<name>(.+)<\/name>/)[1] }
    .filter { |s| s.match? /^\w{4}$/ }  # ICAO codes are 4 letters
    .reverse  # Data in the KML appears to be in ascending order

if top_airport_icao[0] != "KATL"
    puts "Top airport is not KATL (Atlanta). Error in the data?"
    exit
end

puts "#{top_airport_icao.length} ICAO codes identified from Aviation Fanatic"


HEADERS = %i(id name city country iata icao lat long alt timezone dst tz type source)
data = CSV::read(OPEN_FLIGHTS, headers: HEADERS)
    .filter { |d| d[:iata] != "\\N" }
    .filter { |d| top_airport_icao.include? d[:icao] }
    .sort_by { |d| top_airport_icao.index(d[:icao]) }
    .map do |d|
        if d[:city] == d[:country]
            loc = d[:city]
        elsif d[:city] == nil
            loc = d[:country]
        else
            loc = "#{d[:city]}, #{d[:country]}"
        end

        {
            id: d[:iata],
            name: "#{d[:name]} (#{loc})",
            lat: d[:lat].to_f.round(4),
            long: d[:long].to_f.round(4)
        }
    end

puts "#{data.length} airports matched in Open Flights data"
puts "Only taking top #{NUM_AIRPORTS} airports..."

json_str = data[0...NUM_AIRPORTS].to_json
out_str = "jsonpCallback(#{json_str})"
File.open(OUTPUT, "w") { |f| f.write(out_str) }

puts "Successfully generated #{OUTPUT}"