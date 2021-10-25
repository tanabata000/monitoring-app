# アプリケーション名
TASTING
# アプリケーション概要
このアプリケーションでできることを記述。
このアプリケーションは企業の製品のモニタリング行うためのアプリです。
製品の改善点や顧客の要望を明らかにし製品開発をスムーズに行うことができます。
製品をテスターが試し、良い点、改善点、意見要望をレビューします。
企業側はそのレビューを見て自社製品の強みや改善点を確認でき、
また新たなニーズへの対応に役立てることができます。
本アプリケーションはテスター側が製品を評価できるだけでなく、
企業側もテスターのレビューを評価する機能があります。
この機能により参考にならないレビューに関して除外できます。
今後はこの機能を使い、義業側が高評価をつけたテスターに対し、
再度モニタリングを依頼できる機能を実装予定です。
# URL
デプロイ済みのURLを記述。デプロイが済んでいない場合は、デプロイが完了次第記述すること。

# テスト用アカウント
ログイン機能等を実装した場合は、ログインに必要な情報を記述。またBasic認証等を設けている場合は、そのID/Passも記述すること。
# 利用方法
このアプリケーションの利用方法を記述。

# 目指した課題解決
このアプリケーションを通じて、どのような人の、どのような課題を解決しようとしているのかを記述。

# 洗い出した要件
スプレッドシートにまとめた要件定義を記述。

# 実装した機能についての画像やGIFおよびその説明
実装した機能について、それぞれどのような特徴があるのかを列挙する形で記述。画像はGyazoで、GIFはGyazoGIFで撮影すること。

# 実装予定の機能
洗い出した要件の中から、今後実装予定の機能がある場合は、その機能を記述。

# データベース設計
ER図等を添付。

# ローカルでの動作方法
git cloneしてから、ローカルで動作をさせるまでに必要なコマンドを記述。この時、アプリケーション開発に使用した環境を併記することを忘れないこと（パッケージやRubyのバージョンなど）。


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
| review             | references | null: false, foreign_key: true |
| tester             | references | null: false, foreign_key: true |
| review_on_review_id| integer    | null: false                    |
### Association
- belongs_to :company
- belongs_to :tester
