class BikeshareApi 

	include HTTParty
		base_uri 'http://www.capitalbikeshare.com/data/stations/bikeStations.xml'

		def initialize
		end

		def get_bike
			BikeshareApi.get("")
		end

		def nearest_station latitude, longitude
			get_bike["stations"]["station"].min_by(3) { |s| Haversine.distance([latitude.to_f, longitude.to_f],[s["lat"].to_f,s["long"].to_f]).to_miles }
		end
end


