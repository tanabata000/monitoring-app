class ReviewCategory < ActiveHash::Base
  self.data = [
    # '--'はバリデーションにより保存されない設定する
    { id: 1, name: '--' },
    { id: 2, name: 'Sランク（ユニークな意見）' },
    { id: 3, name: 'Aランク（よく評価してある）' },
    { id: 4, name: 'Bランク（普通の評価）' },
    { id: 5, name: '除外（参考にならない評価）' }
  ]
  # メニュー管理モデルのアソシエーションを設定
  include ActiveHash::Associations
  has_many :products
end