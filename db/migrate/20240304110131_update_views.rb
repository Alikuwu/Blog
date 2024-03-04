class UpdateViews < ActiveRecord::Migration[7.1]
  def change
    create_table :views do |t|
      t.references :post, null: false, foreign_key: true
      t.integer :user_id

      t.timestamps
    end
  end
end