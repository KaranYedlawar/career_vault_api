class CreateJoinProfilesSkills < ActiveRecord::Migration[7.1]
  def change
    create_table :profiles_skills, id: false do |t|
      t.uuid :profile_id, null: false
      t.uuid :skill_id, null: false
    end
    add_foreign_key :profiles_skills, :profiles, column: :profile_id, on_delete: :cascade
    add_foreign_key :profiles_skills, :skills, column: :skill_id, on_delete: :cascade
    add_index :profiles_skills, [:profile_id, :skill_id], unique: true
  end
end
