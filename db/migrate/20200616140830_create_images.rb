class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.references :goods_item, null: false, foreign_key: true
      t.string :src, null: false
      t.timestamps
    end
  end
end
 