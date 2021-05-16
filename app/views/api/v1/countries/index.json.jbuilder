json.countries @countries do |country|
  json.name country.name
  json.alpha2 country.alpha2
  json.alpha3 country.alpha3
end