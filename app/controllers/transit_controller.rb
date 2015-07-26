class TransitController < ApplicationController

	def index
		render json: "Add /bikeshare or /stationLocation or /trainRealTime to see json"
	end

	def location
		spot = WmataApi.new
		b = spot.nearest_station(params[:latitude],params[:longitude])
		# b.to_json
		r = { results: b }
		render json: r
	end

	def bikes
		spot = BikeshareApi.new
		b = spot.nearest_station(params[:latitude],params[:longitude])
		# b.to_json
		r = { results: b }
		render json: r
	end

	def minutes
		spot = WmataApi.new
		b = spot.get_real_time(params[:closestStation])
		# b.to_json
		r = { results: b }
		render json: r
	end
end