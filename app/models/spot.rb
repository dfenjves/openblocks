class Spot < ActiveRecord::Base
	has_many :dashboard_spots
	has_many :dashboards, :through => :dashboard_spots

	has_many :spot_tags
	has_many :tags, :through => :spot_tags

	attr_accessor :spot_hash, :current_day_of_week, :current_time_of_day

	# before_save :add_tag

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
		@reference = reference
		self.spot_hash = CLIENT.spot(@reference)
		set_default_values
		set_attributes_from_hash
	end

	def set_default_values
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

	def current_date_and_time
		self.current_day_of_week = Time.now.to_date.strftime("%A").downcase
		self.current_time_of_day = Time.now.strftime("%H:%M").gsub(":","").to_i
	end

	def is_open?
		current_date_and_time
		find_open_and_close
		true if current_time_of_day >= @opening && current_time_of_day <= @closing
	end

	def find_open_and_close
		@opening = self.send("#{current_day_of_week}_open")
		@closing = self.send("#{current_day_of_week}_close")
	end

	def current_status
		is_open? ? "Open" : "Closed"
	end

	def today_schedule
		if @closing.to_s[0..1].to_i >= 13
			@close_hours = @closing.to_s[0..1].to_i-12
		else
			@close_hours = @closing.to_s[0..1]
		end
		
		"#{@opening.to_s[0..1]}:#{@opening.to_s[2..3]} - #{@close_hours}:#{@closing.to_s[2..3]}"
	end

	def add_tag
		CLIENT.spot(@reference).types each do |tag|
			t = Tag.find_by(name: tag)
			self.spot_tag.create(tag_id: t.id)
		end
	end

	def self.new_by_keyword(query, dashboard)
		if query != ""
			PlaceSearch.new(query).results.each do |item|
	  		a = Spot.new
	  		a.new_spot(item.reference)
	  		a.dashboard_spot.create(dashboard_id: dashboard.id)
	  		a.save
	  	end
	  end
	end
end