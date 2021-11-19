class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @offer = Offer.find(params[:offer_id])
    authorize @offer.dwarf
  end

  def create
    @offer = Offer.find(params[:offer_id])
    @review = Review.new(review_params)
    authorize @offer.dwarf
    @review.offer = @offer
    if @review.save
      redirect_to dwarf_path(@offer.dwarf)
    else
      render :new
    end
  end

  def destroy
    @offer = Offer.find(params[:id])
    @dwarf = @offer.dwarf
    authorize @dwarf
    @offer.destroy
    redirect_to dwarf_path(@dwarf)
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
