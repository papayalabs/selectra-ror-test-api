class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|

      t.string :name,                   null: false, default: ""
      t.string :email,                  null: false, default: ""
      t.string :password,               null: false, default: ""
      t.string :password_confirmation,  null: false, default: ""
      t.string :api_key,                null: false, default: ""

      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
  end
end