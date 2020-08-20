class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,          presence: true
  validates :email,             presence: true, uniqueness: true, inclusion: { in: ["@"] }
  validates :password,          presence: true, confirmation: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  validates :first_name,        presence: true, format: /\A[ぁ-んァ-ン一-龥]/
  validates :family_name,       presence: true, format: /\A[ぁ-んァ-ン一-龥]/
  validates :first_name_kana,   presence: true, format: /\A[ァ-ヶー－]+\z/
  validates :family_name_kana,  presence: true, format: /\A[ァ-ヶー－]+\z/
  validates :birthday,          presence: true

end
