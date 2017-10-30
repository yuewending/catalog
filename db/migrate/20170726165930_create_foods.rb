class CreateFoods < ActiveRecord::Migration[5.1]
  def change
    create_table :foods do |t|
      t.string :ingredient
      t.string :spice
      t.string :measurement
      t.string :store_address

      t.timestamps
    end
  end
end
