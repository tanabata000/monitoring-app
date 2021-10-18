class Sex < ActiveHash::Base
  self.data = [
    # '--'はバリデーションにより保存されない設定する
    { id: 1, name: '--' },
    { id: 2, name: '男性' },
    { id: 3, name: '女性' }
  ]
  # メニュー管理モデルのアソシエーションを設定
  include ActiveHash::Associations
  has_many :tester
end