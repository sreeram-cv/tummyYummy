class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :address
      t.string :phone
      t.integer :cart_id

      t.timestamps
    end
  end
end
