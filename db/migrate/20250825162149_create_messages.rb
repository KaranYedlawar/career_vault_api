class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages, id: :uuid do |t|
      t.references :contract, null: false, type: :uuid, foreign_key: { on_delete: :cascade }
      t.references :user, null: false, type: :uuid, foreign_key: { on_delete: :cascade }
      t.text :content, null: false
      t.datetime :read_at
      t.timestamps
    end
    add_index :messages, [:contract_id, :created_at]
  end
end
