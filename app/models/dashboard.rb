class Dashboard < ActiveRecord::Base
	validates :name, presence: true

	has_many :dashboard_spots
	has_many :spots, :through => :dashboard_spots

  def self.search_by_keyword(query)
    if query != ""
      PlaceSearch.new(query).results.collect do |item|
        [item['name'], item['reference']]
      end
    end
  end
end
