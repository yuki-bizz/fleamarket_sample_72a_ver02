class RenameDeliveryWayColumnToGoodsItems < ActiveRecord::Migration[5.0]
  def change
    rename_column :goods_items, :delivery_way, :delivery_way_id
  end
end
