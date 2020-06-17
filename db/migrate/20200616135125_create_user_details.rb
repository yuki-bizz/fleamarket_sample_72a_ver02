class CreateUserDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :user_details do |t|
      t.references :user_address
      t.references :credit_card
      t.integer :tellphone_number
      t.string :self_explanation
      t.integer :sales_amount, null: false
      t.integer :evaluation_icon
      t.timestamps
    end
  end
end
