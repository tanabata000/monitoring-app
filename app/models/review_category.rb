class ReviewCategory < ActiveHash::Base
  self.data = [
    # '--'はバリデーションにより保存されない設定する
    { id: 1, name: '--' },
    { id: 2, name: 'Sランク（ユニークな意見）', point:500 },
    { id: 3, name: 'Aランク（よく評価してある）', point:100 },
    { id: 4, name: 'Bランク（普通の評価）', point:10 },
    { id: 5, name: '除外（参考にならない評価）', point:0 }
  ]
  # メニュー管理モデルのアソシエーションを設定
  include ActiveHash::Associations
  has_many :review_on_review
end