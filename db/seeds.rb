# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

museums = PlaceSearch.new("New York Museums")
museums.results.each do |item|
	puts "loading #{item.name}"
	a = Spot.new
	a.new_spot(item.reference)
end

gyms = PlaceSearch.new("New York Gyms")
gyms.results.each do |item|
	puts "loading #{item.name}"
	a = Spot.new
	a.new_spot(item.reference)
end

libraries = PlaceSearch.new("New York Library")
libraries.results.each do |item|
	puts "loading #{item.name}"
	a = Spot.new
	a.new_spot(item.reference)
end

stores = PlaceSearch.new("New York department stores")
stores.results.each do |item|
	puts "loading #{item.name}"
	a = Spot.new
	a.new_spot(item.reference)
end
