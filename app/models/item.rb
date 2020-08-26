class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :prefecture_code
  belongs_to_active_hash :preparation_day

  with_options presence: true do
    validates :name
    validates :introduction
    validates :category
    validates :condition
    validates :postage_payer
    validates :prefecture_code
    validates :preparation_day
    validates :price, numericality: { in: 300..9_999_999 }
  end

  # ジャンルの選択が「--」の時は保存できないようにする
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :postage_payer_id
    validates :prefecture_code_id
    validates :preparation_day_id
  end

end
