# テーブル設計

## companys テーブル
| Column             | Type    | Options                  |
| ------------------ | ------  | ------------------------ |
| email              | string  | null: false, unique:true |
| encrypted_password | string  | null: false              |
| company_name       | string  | null: false              |
| company_name_kana  | string  | null: false              |
| department         | string  | null: false              |
| postal_code        | integer | null: false              |
| prefecture_id      | integer | null: false              |
| city               | string  | null: false              |
| address            | string  | null: false              |
| building           | string  |                          |
| phone_number       | integer | null: false              |
### Association
- has_many :products
- has_many :review_on_reviws


## testers テーブル
| Column             | Type    | Options                  |
| ------------------ | ------  | ------------------------ |
| nickname           | string  | null: false              |
| email              | string  | null: false, unique:true |
| encrypted_password | string  | null: false              |
| last_name          | string  | null: false              |
| first_name         | string  | null: false              |
| last_name_kana     | string  | null: false              |
| first_name_kana    | string  | null: false              |
| sex_id             | integer | null: false              |
| birth_date_id      | integer | null: false              |
| postal_code        | integer | null: false              |
| prefecture_id      | integer | null: false              |
| city               | string  | null: false              |
| address            | string  | null: false              |
| building           | string  |                          |
| phone_number       | integer | null: false              |
### Association
- has_many :reviews
- has_many :review_on_reviws
- has_one :test_product_info



## products テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| company          | references | null: false, foreign_key: true |
| pd_name          | string     | null: false                    |
| pd_info          | text       | null: false                    |
| pd_category_id   | integer    | null: false                    |
| pd_stock         | integer    | null: false                    |
| pd_review_reward | integer    | null: false                    |
### Association
- belongs_to :company
- has_many :reviews
- has_one :test_product_info


## test_product_infos テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| product          | references | null: false, foreign_key: true |
| tester           | references | null: false, foreign_key: true |
### Association
- has_many :products
- has_many :testers
- has_one :review


## reviews テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| test_product_info  | references | null: false, foreign_key: true |
| product            | references | null: false, foreign_key: true |
| tester             | references | null: false, foreign_key: true |
| good_review        | text       | null: false                    |
| bad_review         | text       | null: false                    |
| opinions_requests  | text       | null: false                    |
### Association
- belongs_to :test_product_info
- belongs_to :product


## review_on_reviws テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| company            | references | null: false, foreign_key: true |
| review_category    | references | null: false, foreign_key: true |
| tester             | references | null: false, foreign_key: true |
| review_on_review_id| integer    | null: false                    |
### Association
- belongs_to :company
- belongs_to :tester
