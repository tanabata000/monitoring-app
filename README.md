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
https://monitoring-app-36875.herokuapp.com

# テスト用アカウント
テスターアカウント(tester000)
メールアドレス：tester@tester
パスワード：tester000

企業アカウント(company)
メールアドレス：company@company
パスワード：company000

# 利用方法
企業アカウントにログインすることでトップページ右下に製品出品ボタンが表示されます。
出品ボタンを押すと出品フォームに遷移します。
出品に必要な記載を入力し、出品ボタンを推しましょう。
トップページに製品が表示されます。
テスターアカウントにログインすることで製品の詳細ページにテスト申請ボタンが表示されます。
製品の画像から詳細ページに遷移しましょう。
テスト申請からテスト申請ボタンを押すとテスト契約が締結され詳細画面に遷移します。
評価ボタンが表示されるようになるので商品が届いたら評価をしましょう。
企業アカウントで自社製品の詳細ページにアクセスするとレビュー評価ページに遷移できます。テスターの評価が完了するとレビュー評価画面からテスター評価を確認できます。
テスターのレビューを評価しましょう。
レビュー評価が完了すると未評価レビューリストからリストが消えます。

# 目指した課題解決
このアプリケーションにより企業のモニタリングを早期に完了させることができます。
また、テスター側が製品を評価するだけでなく、企業側もテスターのレビューを評価できます。
これにより、企業にとって有用なテスターを選別することが可能となります。
また、テスト報酬が高いほどテスターが早く集まる可能性が高くなります。
更に、開発製品が商品化した場合に宣伝や広告ではなくテスターの口コミも期待できます。
安い金額でテスター依頼はテスターに注目されないため、報酬金設定も高くなることが予測できます。それに応じてテスター数も確保できる狙いもあります。
モニタリングが一つの職業として認識されるようになることを目標としたアプリケーションです。

# 洗い出した要件
スプレッドシートにまとめた要件定義を記述。

# 実装した機能についての画像やGIFおよびその説明
実装した機能について、それぞれどのような特徴があるのかを列挙する形で記述。画像はGyazoで、GIFはGyazoGIFで撮影すること。

# 実装予定の機能
製品出品画面に企業側から運営側へ送金する機能を実装
評価完了時に運営側からテスター側へ送金する機能を実装（依頼時に料金発生）
企業が評価したBランク評価以上の評価内容を見ることができる機能を実装
Bランク評価のテスターに対して製品テスト依頼できる機能を実装（依頼時に料金発生）
テスターの評価を企業が評価した時、ランクポイントが貯まる機能実装
ランクポイントが貯まるとテスターのランクが上がる機能実装
高ランクテスターのみにテスト依頼する機能実装（依頼時に料金発生）

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
| Column             | Type       | Options                                     |
| ------------------ | ---------- | ------------------------------------------- |
| test_product_info  | references | null: false, foreign_key: true, unique:true |
| product            | references | null: false, foreign_key: true              |
| tester             | references | null: false, foreign_key: true              |
| good_review        | text       | null: false                                 |
| bad_review         | text       | null: false                                 |
| opinions_requests  | text       | null: false                                 |
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
