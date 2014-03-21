class Spot < ActiveRecord::Base
	has_many :dashboard_spots
	has_many :dashboards, :through => :dashboard_spots

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

	def set_attributes_from_hash
		self.name=spot_hash.name
		self.address=spot_hash.formatted_address
		self.website=spot_hash.website
		if spot_hash.opening_hours == nil
			self.schedule_data = false
		else
			set_hours
			self.schedule_data = true
		end
		self.save
	end

	def set_hours
		hours_hash.each do |day|
			day.each do |action, info|
				week_day = WEEKDAYS[info["day"]]
				self.send("#{week_day}_#{action}=", info["time"].to_i)
			end
		end
	end

	def hours_hash
		spot_hash.opening_hours["periods"]
	end

end
