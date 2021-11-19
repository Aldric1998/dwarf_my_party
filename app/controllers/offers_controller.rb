class OffersController < ApplicationController
  def new
    @offer = Offer.new

    @dwarf = Dwarf.find(params[:dwarf_id])
    authorize @dwarf
  end

  def create
    @offer = Offer.new(offer_params)

    @dwarf = Dwarf.find(params[:dwarf_id])
    authorize @dwarf
    @offer.dwarf = @dwarf
    @offer.user = current_user
    @dwarf.availability = false
    if @offer.save
      redirect_to dwarf_path(@dwarf)
    else
      render :new
    end
  end

  def destroy
    @offer = Offer.find(params[:id])
    @dwarf = @offer.dwarf
    authorize @dwarf
    if @offer.review
      @review = @offer.review
      @review.destroy
    end
    @offer.destroy
    redirect_to dwarf_path(@dwarf)
  end

  private

  def offer_params
    params.require(:offer).permit(:starts_at, :ends_at, :message, :status)
  end
end
