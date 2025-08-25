class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users, id: :uuid do |t|
      t.integer :role, null: false, default: 2 # 0=admin,1=client,2=freelancer
      t.timestamps
    end

    add_check_constraint :users, "role IN (0,1,2)", name: "users_role_check"
    add_index :users, :role
  end
end
