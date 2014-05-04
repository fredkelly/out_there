class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :uid
      t.string :provider

      t.timestamps
    end
    add_index :users, :uid, unique: true
  end
end
