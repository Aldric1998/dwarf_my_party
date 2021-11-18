class DwarvesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]

  def index
    @dwarves = Dwarf.all
    @markers = @dwarves.geocoded.map do |dwarf|
      {
        lat: dwarf.latitude,
        lng: dwarf.longitude,
        info_window: render_to_string(partial: "info_window", locals: { dwarf: dwarf }),

      }

    end
  end

  def new
    @dwarf = Dwarf.new
  end

  def create
    @dwarf = Dwarf.new(dwarf_params)
    @dwarf.user = current_user
    @dwarf.availability = true
    @dwarf.save
    redirect_to dwarf_path(@dwarf)
  end

  def show
    @dwarf = Dwarf.find(params[:id])
    @offers = @dwarf.offers.where(user: current_user)
  end

  def destroy
    @dwarf = Dwarf.find(params[:id])
    @dwarf.destroy
    redirect_to dwarves_path
  end

  private

  def dwarf_params
    params.require(:dwarf).permit(:price, :name, :description, :localisation, :availability, :picture)
  end
end
