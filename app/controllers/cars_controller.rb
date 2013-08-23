class CarsController < ApplicationController
	def gallery_car
		@car = Car.find(params[:car_id])
		render layout: false
	end
end
