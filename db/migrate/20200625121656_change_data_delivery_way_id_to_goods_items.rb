class ChangeDataDeliveryWayIdToGoodsItems < ActiveRecord::Migration[5.0]
  def change
    change_column :goods_items, :delivery_way_id, :integer
  end
end
