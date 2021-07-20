class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.integer :owner_id
      t.text :introduction
      t.string :image_id
      t.string :name
      
      t.timestamps
    end
  end
end
