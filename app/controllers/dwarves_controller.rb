class DwarvesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]

  def index
    @dwarves= policy_scope(Dwarf)
    if params[:query].present?
      sql_query = " \
        dwarves.name @@ :query \
        OR dwarves.description @@ :query \
        OR dwarves.localisation @@ :query \
        OR users.name @@ :query \
        OR users.surname @@ :query \
      "
      @dwarves = Dwarf.joins(:user).where(sql_query, query: "%#{params[:query]}%")
    else
      @dwarves = Dwarf.all
    end

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
    authorize @dwarf
  end

  def create
    @dwarf = Dwarf.new(dwarf_params)
    authorize @dwarf
    @dwarf.user = current_user
    @dwarf.availability = true
    @dwarf.save
    redirect_to dwarf_path(@dwarf)
  end

  def show

    @dwarf = Dwarf.find(params[:id])
    authorize @dwarf
    @offers = @dwarf.offers.where(user: current_user)
    @markers = @dwarf.geocode
    @markers = [{
        lat: @dwarf.latitude,
        lng: @dwarf.longitude,
        info_window: render_to_string(partial: "info_window", locals: { dwarf: @dwarf }),
      }]
  end

  def destroy
    @dwarf = Dwarf.find(params[:id])
    authorize @dwarf
    @dwarf.destroy
    redirect_to dwarves_path
  end

  private

  def dwarf_params
    params.require(:dwarf).permit(:price, :name, :description, :localisation, :availability, :picture)
  end
end
