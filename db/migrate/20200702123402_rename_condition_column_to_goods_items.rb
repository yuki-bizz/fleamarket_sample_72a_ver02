class RenameConditionColumnToGoodsItems < ActiveRecord::Migration[5.0]
  def change
    rename_column :goods_items, :condition, :condition_id
    rename_column :goods_items, :shipping_fee, :shipping_fee_id
    rename_column :goods_items, :province, :province_id
    rename_column :goods_items, :delivery_date, :delivery_date_id
  end
end
