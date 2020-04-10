class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.text :property_name
      t.integer :rental_price
      t.text :address
      t.integer :age
      t.text :note

      t.timestamps
    end
  end
end
