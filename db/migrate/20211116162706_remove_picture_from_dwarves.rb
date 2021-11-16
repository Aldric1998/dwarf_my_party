class RemovePictureFromDwarves < ActiveRecord::Migration[6.0]
  def change
    remove_column :dwarves, :picture
  end
end
