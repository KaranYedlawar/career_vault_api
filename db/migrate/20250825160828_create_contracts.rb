class CreateContracts < ActiveRecord::Migration[7.1]
  def change
    create_table :contracts, id: :uuid do |t|
      t.references :job, null: false, type: :uuid, foreign_key: { on_delete: :cascade }, index: { unique: true }
      t.references :client, null: false, type: :uuid, foreign_key: { to_table: :users, on_delete: :restrict }
      t.references :freelancer, null: false, type: :uuid, foreign_key: { to_table: :users, on_delete: :restrict }
      t.integer :status, null: false, default: 0 # 0=active,1=completed,2=disputed,3=cancelled
      t.timestamps
    end
    add_check_constraint :contracts, "status IN (0,1,2,3)", name: "contracts_status_check"
    add_index :contracts, :status
  end
end
