class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|     
      t.references :company, null: false, foreign_key: true
      t.string :pd_name, null: false
      t.text :pd_info, null: false
      t.integer :pd_category_id, null: false
      t.integer :pd_stock, null: false
      t.integer :pd_review_reward, null: false
      t.timestamps
    end
  end
end
