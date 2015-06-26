class WmataApi 

	include HTTParty
		base_uri 'https://api.wmata.com'

		def initialize
		end

		def get_station 
			WmataApi.get("/Rail.svc/json/jStations?", query: {api_key:ENV["WMATA_API_KEY"]})
		end

		def nearest_station latitude, longitude
			get_station["Stations"].min_by(3) { |s| Haversine.distance([latitude.to_f, longitude.to_f],[s["Lat"].to_f,s["Lon"].to_f]).to_miles }
		end

		def get_real_time closestStation
			response = WmataApi.get("/StationPrediction.svc/json/GetPrediction/#{closestStation}", query: {api_key:ENV["WMATA_API_KEY"]})
			response["Trains"].first(6)
		end
end