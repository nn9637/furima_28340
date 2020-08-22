class Item < ApplicationRecord
  has_one :item_img
  belongs_to :user
end