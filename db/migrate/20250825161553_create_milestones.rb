class CreateMilestones < ActiveRecord::Migration[7.1]
  def change
    create_table :milestones, id: :uuid do |t|
      t.references :contract, null: false, type: :uuid, foreign_key: { on_delete: :cascade }
      t.string  :title, null: false
      t.integer :amount_cents, null: false, default: 0
      t.date    :due_date
      t.integer :status, null: false, default: 0 # 0=pending,1=submitted,2=approved,3=paid
      t.integer :position
      t.timestamps
    end
    add_check_constraint :milestones, "status IN (0,1,2,3)", name: "milestones_status_check"
    add_index :milestones, [:contract_id, :position]
    add_index :milestones, :status
  end
end
