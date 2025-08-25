class CreateJoinJobsSkills < ActiveRecord::Migration[7.1]
  def change
    create_table :jobs_skills, id: false do |t|
      t.uuid :job_id, null: false
      t.uuid :skill_id, null: false
    end
    add_foreign_key :jobs_skills, :jobs, column: :job_id, on_delete: :cascade
    add_foreign_key :jobs_skills, :skills, column: :skill_id, on_delete: :cascade
    add_index :jobs_skills, [:job_id, :skill_id], unique: true
  end
end
