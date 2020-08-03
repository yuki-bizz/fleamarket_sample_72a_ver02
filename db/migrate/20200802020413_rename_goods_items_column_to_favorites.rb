class RenameGoodsItemsColumnToFavorites < ActiveRecord::Migration[5.0]
  def change
    rename_column :favorites, :goods_items_id, :goods_item_id
  end
end
