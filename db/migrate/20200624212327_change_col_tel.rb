class ChangeColTel < ActiveRecord::Migration[5.0]
  def up
    change_column :users, :tellphone_number ,:string
  end
end
