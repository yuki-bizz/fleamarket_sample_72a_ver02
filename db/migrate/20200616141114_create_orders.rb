class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :goods_item, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      # t.integer :payment_way, null: false
      # t.integer :payment_status, null: false
      # t.integer :shipping_status, null: false
      # t.integer :delivery_status, null: false
      t.timestamps
    end
  end
end
