class CreateReviewOnReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :review_on_reviews do |t|
      t.references :company, null: false, foreign_key: true
      t.references :review, null: false, foreign_key: true
      t.references :tester, null: false, foreign_key: true
      t.integer :review_category_id, null: false
      t.timestamps
    end
  end
end
