class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  acts_as_paranoid
  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :items, through: :cart_items

  with_options presence: true do
  validates :family_name
  validates :last_name
  validates :family_name_kana
  validates :last_name_kana
  validates :postcode
  validates :address
  validates :phone_number
  validates :email
end

end
