class PdCategory < ActiveHash::Base
  self.data = [
    # '--'はバリデーションにより保存されない設定する
    { id: 1, name: '--' },
    { id: 2, name: '美容・化粧品・エステ' },
    { id: 3, name: 'インテリア' },
    { id: 4, name: '家電' }
  ]
  # メニュー管理モデルのアソシエーションを設定
  include ActiveHash::Associations
  has_many :products
end