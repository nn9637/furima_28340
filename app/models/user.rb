class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/

  validates :nickname,          presence: true
  validates :email,             presence: true, uniqueness: true, inclusion: { in: ["@"] }
  validates :password,          presence: true, confirmation: true, format: { with: VALID_PASSWORD_REGEX }
  validates :password_confirmation, presence: true
  validates :first_name,        presence: true, format: { with: VALID_NAME_REGEX }
  validates :family_name,       presence: true, format: { with: VALID_NAME_REGEX }
  validates :first_name_kana,   presence: true, format: { with: VALID_PASSWORD_REGEX }
  validates :family_name_kana,  presence: true, format: { with: VALID_PASSWORD_REGEX }
  validates :birthday,          presence: true

end