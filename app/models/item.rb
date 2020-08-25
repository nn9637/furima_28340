class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :introduction
    validates :prefecture_code
    validates :condition
    validates :postage_payer
    validates :preparation_day
    validates :price, numericality: { in: 300..9_999_999 }
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  # ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1 }
end
