class ChangeGoodsItems < ActiveRecord::Migration[5.0]
  def change
    add_column :goods_items, :category_id, :integer, null: false
  end
end
