class CreateDwarves < ActiveRecord::Migration[6.0]
  def change
    create_table :dwarves do |t|
      t.integer :price
      t.string :name
      t.string :description
      t.string :localisation
      t.string :availability
      t.string :picture
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
