class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :agent_id
      t.string :items

      t.timestamps
    end
  end
end
