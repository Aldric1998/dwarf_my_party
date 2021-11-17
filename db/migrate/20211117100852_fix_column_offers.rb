class FixColumnOffers < ActiveRecord::Migration[6.0]
  def change
    rename_column :offers, :start_date, :starts_at
    rename_column :offers, :end_date, :ends_at
  end
end
