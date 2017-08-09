class CreateRaites < ActiveRecord::Migration[5.0]
  def change
    create_table :raites do |t|
      t.string :user_id
      t.integer :post_id
      t.float :value
      t.timestamps
    end

    add_index :raites, [:user_id, :post_id], :unique => true
    add_index :raites, :user_id
    add_index :raites, :post_id
  end
end
