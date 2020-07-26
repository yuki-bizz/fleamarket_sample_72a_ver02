class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.references :user_id
      t.references :goods_item_id
      t.text :text
      t.timestamps
    end
  end
end
