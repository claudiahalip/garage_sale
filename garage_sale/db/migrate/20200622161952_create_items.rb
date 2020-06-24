class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.integer :size 
      t.string :brand 
      t.string :color 
      t.string :condition
      t.text :description
      t.float :price
      t.integer :user_id
    end 
  end
end
