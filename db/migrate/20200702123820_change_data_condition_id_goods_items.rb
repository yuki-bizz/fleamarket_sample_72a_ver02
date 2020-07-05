class ChangeDataConditionIdGoodsItems < ActiveRecord::Migration[5.0]
  def change
    change_column :goods_items, :condition_id, :integer
    change_column :goods_items, :shipping_fee_id, :integer
    change_column :goods_items, :province_id, :integer
    change_column :goods_items, :delivery_date_id, :integer
  end
end
