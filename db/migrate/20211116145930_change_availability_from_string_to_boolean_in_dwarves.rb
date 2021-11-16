class ChangeAvailabilityFromStringToBooleanInDwarves < ActiveRecord::Migration[6.0]
  def change
    remove_column :dwarves, :availability
    add_column :dwarves, :availability, :boolean
  end
end
