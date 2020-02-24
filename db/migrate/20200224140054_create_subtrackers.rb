class CreateSubtrackers < ActiveRecord::Migration[6.0]
  def change
    create_table :subtrackers do |t|
      t.references :tracker, null: false, foreign_key: true
      t.integer :count, default: 0
      t.string :referrer

      t.timestamps
    end
  end
end
