class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :rememberable, :validatable,
    :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  validates :name, presence: true, length: {maximum: 50}
  validates :phone, presence: true, numericality: true,
    length: {maximum: 11, minimum: 8}

  has_many :likes
  has_many :ratings
  has_many :reviews
  has_many :comments
  has_many :bookings
  has_many :bank_cards

  def current_user? user
    self == user
  end

  class << self
    def from_omniauth auth
      User.find_or_create_by email: auth.info.email do |user|
        user.email = auth.info.email
        user.name = auth.info.name
        user.password = Devise.friendly_token[0,20]
      end
    end

    def new_with_session params, session
      super.tap do |user|
        if data = session["devise.auth_data"] &&
          session["devise.auth_data"]["extra"]["raw_info"]
          user.email = data["email"]
        end
      end
    end
  end
end
