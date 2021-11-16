class DwarvesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]

  def index
    @dwarves = Dwarf.all
  end

  def new
    @dwarf = Dwarf.new
  end

  def create
    @dwarf = Dwarf.new(dwarf_params)
    @dwarf.user = current_user
    @dwarf.save
    redirect_to dwarf_path(@dwarf)
  end

  def show
    @dwarf = Dwarf.find(params[:id])
  end

  private

  def dwarf_params
    params.require(:dwarf).permit(:price, :name, :description, :localisation, :availability, :picture)
  end
end
