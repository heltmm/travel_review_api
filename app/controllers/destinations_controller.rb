class DestinationsController < ApplicationController
  def index
    @destinations = Destination.all
    json_response(@destinations)
  end

  def show
    @destination = Destination.find(params[:id])
    json_response(@destination)
  end

  def create
    if @destination = Destination.create!(destination_params)
       json_response(@destination, :created)
    end
  end

  def update
    @destination = Destination.find(params[:id])
    if @destination.update!(destination_params)
      render status: 200, json: {
        message: "Your Destination has been updated successfully."
      }
    end
  end

  def destroy
    @destination = Destination.find(params[:id])
    if @destination.destroy
      render status: 200, json: {
        message: "Your Destiation has been successfully removed."
      }
    end
  end

  private

  def destination_params
    params.permit(:country, :city, :category, :price, :accommodations, :name)
  end
end
