class PlaceSearch
	attr_accessor :results
	
	def initialize(query)
		self.results = CLIENT.spots_by_query(query)
	end

end