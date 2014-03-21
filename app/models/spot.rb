class Spot < ActiveRecord::Base

	after_initialize :default_values
	attr_accessor :spot_hash
	WEEKDAYS = {
		0 => "sunday",
		1 => "monday",
		2 => "tuesday",
		3 => "wednesday",
		4 => "thursday",
		5 => "friday",
		6 => "saturday"
	}

	def new_spot(reference)
		self.spot_hash = CLIENT.spot(reference)
		set_attributes_from_hash
	end

	def default_values
		WEEKDAYS.each do |number, name|
			self.send("#{name}_open=", 0)
			self.send("#{name}_close=", 0)
		end
	end

[{"close"=>{"day"=>0, "time"=>"1730"}, "open"=>{"day"=>0, "time"=>"1000"}}, {"close"=>{"day"=>1, "time"=>"1730"}, "open"=>{"day"=>1, "time"=>"1000"}}, {"close"=>{"day"=>2, "time"=>"1730"}, "open"=>{"day"=>2, "time"=>"1000"}}, {"close"=>{"day"=>3, "time"=>"1730"}, "open"=>{"day"=>3, "time"=>"1000"}}, {"close"=>{"day"=>4, "time"=>"1730"}, "open"=>{"day"=>4, "time"=>"1000"}}, {"close"=>{"day"=>5, "time"=>"2100"}, "open"=>{"day"=>5, "time"=>"1000"}}, {"close"=>{"day"=>6, "time"=>"2100"}, "open"=>{"day"=>6, "time"=>"1000"}}] 

	def set_attributes_from_hash
		self.name=spot_hash.name
		self.address=spot_hash.formatted_address
		self.website=spot_hash.website
		hours_hash.each do |day|
			day.each do |action, info|
				week_day = WEEKDAYS[info["day"]]
				self.send("#{week_day}_#{action}=", info["time"].to_i)
			end
		end
		self.save
	end

	def hours_hash
		spot_hash.opening_hours["periods"]
	end

end
