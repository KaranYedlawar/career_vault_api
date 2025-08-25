class CreatePayments < ActiveRecord::Migration[7.1]
  def change
    create_table :payments, id: :uuid do |t|
      t.references :contract, null: false, type: :uuid, foreign_key: { on_delete: :restrict }
      t.references :milestone, type: :uuid, foreign_key: { on_delete: :nullify }
      t.integer :amount_cents, null: false, default: 0
      t.integer :status, null: false, default: 0 # 0=pending,1=succeeded,2=refunded
      t.string  :stripe_payment_intent_id
      t.string  :stripe_transfer_id
      t.timestamps
    end
    add_check_constraint :payments, "status IN (0,1,2)", name: "payments_status_check"
    add_index :payments, :status
    add_index :payments, :stripe_payment_intent_id, unique: true
    add_index :payments, :stripe_transfer_id, unique: true
  end
end
