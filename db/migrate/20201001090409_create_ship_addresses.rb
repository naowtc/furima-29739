class CreateShipAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :ship_addresses do |t|
      t.string :post_code,              null: false
      t.integer :prefectures_id,        foreign_key: true
      t.string :city,                   null: false
      t.string :house_number,           null: false
      t.string :building_name              
      t.string :phone_number,           null: false
      t.references :order,              foreign_key: true
      t.timestamps
    end
  end
end
