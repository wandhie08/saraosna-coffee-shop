class OrderActionJob < ApplicationJob
  queue_as :default

  def perform(order, status)
    case status
    when 'done'
      order.confirm_done!
    when 'processing'
      order.update(status: 1, queuing_time: Time.current)
      # order.status_processing!
    else
      Rails.logger.info("===== nothink here ====")
    end
    # order.status_"#{status.to_sym}"
  end
end
