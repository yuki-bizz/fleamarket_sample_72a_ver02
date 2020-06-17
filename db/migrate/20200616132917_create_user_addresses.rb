class CreateUserAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :user_addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :postcode, null: false
      t.references :area, null: false, foreign_key: true
      t.string :city, null: false
      t.string :address1, null: false
      t.string :address2
      t.timestamps
    end
  end
end
