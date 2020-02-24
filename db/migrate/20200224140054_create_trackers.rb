class CreateTrackers < ActiveRecord::Migration[6.0]
  def change
    create_table :trackers do |t|
      t.references :organisation, null: false, foreign_key: true
      t.integer :count, default: 0
      t.string :referrer

      t.timestamps
    end
  end
end
