class CreateProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :profiles, id: :uuid do |t|
      t.references :user, null: false, type: :uuid, foreign_key: { on_delete: :cascade }
      t.string  :first_name
      t.string  :last_name
      t.text    :bio
      t.decimal :hourly_rate, precision: 10, scale: 2
      t.string  :location
      t.timestamps
    end
  end
end
