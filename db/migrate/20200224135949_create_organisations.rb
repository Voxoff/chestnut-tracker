class CreateOrganisations < ActiveRecord::Migration[6.0]
  def change
    create_table :organisations do |t|
      t.string :site
      t.string :name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
