class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.references :user
      t.string :customer_id
      t.string :card_id
      t.timestamps
    end
  end
end
