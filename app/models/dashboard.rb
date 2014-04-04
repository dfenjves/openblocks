class Dashboard < ActiveRecord::Base
	validates :name, presence: true

	has_many :dashboard_spots
	has_many :spots, :through => :dashboard_spots

end
