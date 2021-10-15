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
| building           | string  | null: false              |
| phone_number       | integer | null: false              |
### Association
- has_many :products
- has_many :tester_ranks


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
| postal_code        | integer | null: false              |
| prefecture_id      | integer | null: false              |
| city               | string  | null: false              |
| address            | string  | null: false              |
| building           | string  | null: false              |
| phone_number       | integer | null: false              |
### Association
- has_many :reviews
- has_many :tester_ranks


## products テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| company          | references | null: false, foreign_key: true |
| pd_name          | string     | null: false                    |
| pd_info          | text       | null: false                    |
| pd_category_id   | integer    | null: false                    |
| pd_stock         | string     | null: false                    |
| pd_review_reward | integer    | null: false                    |
### Association
- belongs_to :company
- has_many :reviews


## reviews テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| product            | references | null: false                    |
| user               | references | null: false, foreign_key: true |
| evaluation point   | integer    | null: false                    |
| good_review        | text       | null: false                    |
| bad_review         | text       | null: false                    |
| review_category_id | integer    | null: false                    |
### Association
- belongs_to :tester
- belongs_to :product


## tester_ranks テーブル
| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| tester            | references | null: false, foreign_key: true |
| rank_id           | integer    | null: false, foreign_key: true |
| point             | integer    | null: false, foreign_key: true |
### Association
- belongs_to :tester
