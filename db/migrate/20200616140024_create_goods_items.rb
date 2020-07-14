class CreateGoodsItems < ActiveRecord::Migration[5.0]
  def change
    create_table :goods_items do |t|
      t.references :user, null: false, foreign_key: true 
      t.string :name, null: false
      t.text :explanation, null: false
      t.string :brand
      t.string :condition, null: false
      t.string :shipping_fee, null: false
      t.string :province , null: false
      t.string :delivery_way, null: false
      t.string :delivery_date, null: false
      t.integer :selling_price, null: false
      t.string :status
      t.integer :seller_id
      t.integer :buyer_id
      t.timestamps
    end
  end
end
