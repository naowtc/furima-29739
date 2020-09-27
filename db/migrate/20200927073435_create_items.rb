class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user, foreign_key: true

      t.string :name,               null: false
      t.string :description,               null: false
      t.string :price,               null: false
      
      t.integer :category_id,               null: false
      t.integer :condition_id,               null: false
      t.integer :postage_payer_id,               null: false
      t.integer :prefecture_id,               null: false
      t.integer :shipment_time_id,               null: false

      t.timestamps
    end
  end
end
