class UserPurchase

  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_code, :city, :house_number, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :token
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_code
    validates :city
    validates :house_number
    validates :phone_number, format: {with: /(0{1}\d{9,10})/}
  end

  validates :prefecture_code, numericality: { other_than: 1, message: "can't be blank" }

  def save
    Address.create(postal_code: postal_code, prefecture_code: prefecture_code, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, user_id: user_id)
    ItemPurchase.create(user_id: user_id, item_id: item_id)
  end
end