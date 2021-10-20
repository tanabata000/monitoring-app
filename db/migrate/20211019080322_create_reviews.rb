class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.references :test_product_info, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.references :tester, null: false, foreign_key: true
      t.text :good_review, null: false
      t.text :bad_review, null: false
      t.text :opinions_requests
      t.timestamps
    end
  end
end
