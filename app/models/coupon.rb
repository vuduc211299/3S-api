class Coupon < ApplicationRecord
  belongs_to :place, inverse_of: :coupons
  validates :place, presence: true

  validates :code_name, :start_date, :expire_date, :discount, presence: true
  validate :expire_date_after_start_date

  private

  def expire_date_after_start_date
    return if start_date.blank? || expire_date.blank?

    errors.add(:expire_date, "must be after the start date") if expire_date.to_i <= start_date.to_i
  end
end
