class CreateGoodsItems < ActiveRecord::Migration[5.0]
  def change
    create_table :goods_items do |t|
      t.references :user, null: false, foreign_key: true 
      t.string :name, null: false
      t.string :explanation, null: false
      t.references :category, null: false, foreign_key: true
      t.references :brand
      t.integer :condition, null: false
      t.integer :shipping_fee, null: false
      t.references :area , null: false, foreign_key: true
      t.integer :delivery_date, null: false
      t.integer :selling_price, null: false
      t.integer :size, null: false
      t.integer :delivery_way, null: false
      t.integer :status, null: false
      t.timestamps
    end
  end
end
