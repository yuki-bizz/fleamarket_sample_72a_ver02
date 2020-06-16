class CreateEvaluations < ActiveRecord::Migration[5.0]
  def change
    create_table :evaluations do |t|
      t.references :goods_item, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :user_icon
      t.string :user_evaluation
      t.timestamps
    end
  end
end
