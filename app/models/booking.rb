class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :place

  enum status: {pending: 1, paid: 2, canceled: 3, paypal_executed: 4}

  validates :start_date, :end_date, presence: true, availability: true
  validate :end_date_after_start_date

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    errors.add(:end_date, "must be after the start date") if end_date.to_i <= start_date.to_i
  end
end
