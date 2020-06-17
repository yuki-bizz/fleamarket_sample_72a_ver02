class CreateCategoryBrands < ActiveRecord::Migration[5.0]
  def change
    create_table :category_brands do |t|
      t.references :category, null: false, foreign_key: true
      t.references :brand, null: false, foreign_key: true
      t.timestamps
    end
  end
end
