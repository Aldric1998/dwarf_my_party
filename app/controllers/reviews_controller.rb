class ReviewsController < ApplicationController
  def create
    @offer = offer.find(params[:offer_id])
    @review = Review.new(review_params)
    @review.offer = @offer
    if @review.save
      redirect_to offer_path(@offer)
    else
      render "offers/show"
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
