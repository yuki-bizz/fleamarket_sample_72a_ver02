class ChangeDatatypeUserOfCards < ActiveRecord::Migration[5.0]
  def change
    change_column :cards, :user_id, :string
  end
end
