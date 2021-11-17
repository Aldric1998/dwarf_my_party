class OffersController < ApplicationController
  def new
    @offer = Offer.new
    @dwarf = Dwarf.find(params[:dwarf_id])
  end

  def create
    @offer = Offer.new(offer_params)
    @dwarf = Dwarf.find(params[:dwarf_id])
    @offer.dwarf = @dwarf
    @offer.user = current_user
    if @offer.save
      redirect_to dwarf_path(@dwarf)
    else
      render :new
    end
  end

  def edit
  end

  def update

  end

  private

  def offer_params
    params.require(:offer).permit(:starts_at, :ends_at, :message, :status)
  end
end
