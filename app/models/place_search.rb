class PlaceSearch
	attr_accessor :results
	
	def initialize(query)
		@query = query.gsub(" ", "+")
		http = HTTParty.get("https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{@query}&sensor=true&key=#{ENV["PLACES_API_KEY"]}")
		self.results = http["results"]
	end

end