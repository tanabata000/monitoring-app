class CreateTestProductInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :test_product_infos do |t|
      t.references :product, null: false, foreign_key: true
      t.references :tester, null: false, foreign_key: true
      t.timestamps
    end
  end
end
