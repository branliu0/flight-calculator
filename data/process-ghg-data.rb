#!/usr/bin/env ruby

require 'csv'
require 'json'

DATA = "emissions-per-capita-2014.csv"
OUTPUT = "emissions-cdf-jsonp.js"

HEADERS = %i(country year pop emissions)
data = File.readlines(DATA)
    .slice(2...-2)  # First two rows are info (and invalid CSV) + header; last two are World + EU
    .then { |lines| CSV.parse(lines.join, headers: HEADERS) }

# Fill in data for Eritrea
eritrea = data.find { |d| d[:country] == "Eritrea" }
eritrea[:pop] = 3311444
eritrea[:emissions] = 4978e3 / eritrea[:pop]

data = data.map do |d|
    d[:pop] = d[:pop].to_i
    d[:emissions] = d[:emissions].to_f.round(2)
    d
end

cdf = data.sort_by { |d| d[:emissions] }
    .reduce(Array.new) do |acc, el|
        if acc.empty?
            acc.push([el[:emissions], el[:pop]])
        elsif acc[-1][0] == el[:emissions]
            acc[-1][1] += el[:pop]
            acc
        else
            acc.push([el[:emissions], acc[-1][1] + el[:pop]])
        end
    end

json_str = cdf.to_json
out_str = "ghgCallback(#{json_str})"
File.open(OUTPUT, "w") { |f| f.write(out_str) }

puts "Successfully generated #{OUTPUT}"