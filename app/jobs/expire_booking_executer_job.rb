class ExpireBookingExecuterJob < ApplicationJob
  queue_as :default

  def perform item
    if item.pending?
      item.update status: Settings.enum.booking.status.incomplete
    end
  end
end
