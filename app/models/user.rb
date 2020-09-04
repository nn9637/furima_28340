class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :item_purchases
  has_one :address

  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i.freeze
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
  VALID_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze

  with_options presence: true do
    validates :nickname
    validates :email, uniqueness: true

    with_options format: { with: VALID_PASSWORD_REGEX } do
      validates :password, confirmation: true
      validates :password_confirmation
    end

    with_options format: { with: VALID_NAME_REGEX } do
      validates :first_name
      validates :family_name
    end

    with_options format: { with: VALID_KANA_REGEX } do
      validates :first_name_kana
      validates :family_name_kana
    end

    validates :birthday
  end
end
