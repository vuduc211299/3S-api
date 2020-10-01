class User < ApplicationRecord
  VALID_EMAIL_REGEX = Settings.validations.user.email.regex
  SIGN_UP_PARAMS = %i(name email password password_confirmation \
    gender address birthday avatar phone).freeze
  LOGIN_PARAMS = %i(email password).freeze

  has_many :places, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :name, presence: true,
    length: {maximum: Settings.validations.user.name.max_length}
  validates :email, presence: true,
    length: {maximum: Settings.validations.user.email.max_length},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness:  true
  validates :address, presence: true,
    allow_nil: true,
    length: {maximum: Settings.validations.user.address.max_length}
  validates :birthday, presence: true,
    allow_nil: true
  validates :phone, presence: true,
    allow_nil: true
  validates :avatar, presence: true,
    allow_nil: true
  validates :gender, presence: true,
    allow_nil: true

  before_save :downcase_email

  has_secure_password

  private

  class << self
    def digest string
      cost =
        if ActiveModel::SecurePassword.min_cost
          BCrypt::Engine::MIN_COST
        else
          BCrypt::Engine.cost
        end
      BCrypt::Password.create(string, cost: cost)
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  def downcase_email
    email.downcase!
  end
end
