class CreateApplications < ActiveRecord::Migration[7.1]
  def change
    create_table :applications, id: :uuid do |t|
      t.references :job, null: false, type: :uuid, foreign_key: { on_delete: :cascade }
      t.references :freelancer, null: false, type: :uuid, foreign_key: { to_table: :users, on_delete: :cascade }
      t.text    :cover_letter
      t.integer :status, null: false, default: 0 # 0=pending,1=shortlisted,2=accepted,3=rejected
      t.timestamps
    end
    add_check_constraint :applications, "status IN (0,1,2,3)", name: "applications_status_check"
    add_index :applications, [:job_id, :freelancer_id], unique: true # one application per job per freelancer
    add_index :applications, :status
  end
end
