class ReviewsController < ApplicationController
  def index
    @destination = Destination.find(params[:destination_id])
    @reviews = @destination.reviews
    json_response(@reviews)
  end

  def show
    @destination = Destination.find(params[:destination_id])
    @review = Review.find(params[:id])
    json_response(@review)
  end

  def create
    @destination = Destination.find(params[:destination_id])
    if @review = @destination.reviews.create!(review_params)
      json_response(@review, :created)
    end
  end

  def update
    @destination = Destination.find(params[:destination_id])
    @review = Review.find(params[:id])
    if @review.update!(review_params)
      render status: 200, json: {
        message: "Your Review has been successfully updated."
      }
    end
  end

  def destroy
    @destination = Destination.find(params[:destination_id])
    @review = Review.find(params[:id])
    if @review.destroy
      render status: 200, json: {
        message: "Your Review has been successfully removed."
      }
    end
  end

  private


  def review_params
    params.permit(:author, :content, :rating)
  end
end
