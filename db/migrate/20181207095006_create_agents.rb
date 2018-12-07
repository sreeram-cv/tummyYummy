class CreateAgents < ActiveRecord::Migration
  def change
    create_table :agents do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :confpassword
      t.string :address
      t.string :phone
      t.string :items

      t.timestamps
    end
  end
end
