class OffersController < ApplicationController
  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    @dwarf = Dwarf.find(params[:dwarf_id])
    @offer.dwarf = @dwarf
    @offer.user = current_user
    @offer.save

    redirect_to dwarf_path(@offer)
  end

  def edit
  end

  def update

  end

  private

  def offer_params
    params.require(:offer).permit(:start_date, :end_date, :message, :status)
  end
end
