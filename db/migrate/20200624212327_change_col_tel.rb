class ChangeColTel < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :tellphone_number ,:string
  end
end
