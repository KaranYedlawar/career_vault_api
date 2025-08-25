class CreateJobs < ActiveRecord::Migration[7.1]
  def change
    create_table :jobs, id: :uuid do |t|
      t.references :client, null: false, type: :uuid, foreign_key: { to_table: :users, on_delete: :cascade }
      t.string  :title, null: false
      t.text    :description
      t.integer :budget_cents, null: false, default: 0
      t.integer :status, null: false, default: 0 # 0=open,1=in_progress,2=closed
      t.timestamps
    end
    add_check_constraint :jobs, "status IN (0,1,2)", name: "jobs_status_check"
    add_index :jobs, :status
    add_index :jobs, :budget_cents
  end
end
