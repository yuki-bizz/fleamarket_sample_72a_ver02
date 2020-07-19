class RenameCategoryToCategoryIdGoodsItems < ActiveRecord::Migration[5.0]
  def change
    rename_column :goods_items, :category, :category_id
  end
end
