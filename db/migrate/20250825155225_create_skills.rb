class CreateSkills < ActiveRecord::Migration[7.1]
  enable_extension 'citext' unless extension_enabled?('citext')

  def change
    create_table :skills, id: :uuid do |t|
      t.citext :name, null: false
      t.timestamps
    end
    add_index :skills, :name, unique: true
  end
end
