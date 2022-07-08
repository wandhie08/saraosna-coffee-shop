class DisplayController < ApplicationController
  before_action :get_orders
  def index
    @pending_orders = @orders.status_pending.latest.limit(7)
    @processing_orders = @orders.status_processing.latest.limit(7)
    @sevent_orders = @orders.status_done.by_serving_time.limit(7)
    @second_orders = @orders.status_done.by_serving_time.excepts(@sevent_orders).limit(7)
    @orders_done = @orders.status_done.excepts(@sevent_orders).by_serving_time
  end

  def tv
    @sevent_orders = @orders.status_done.by_serving_time.limit(7)
    @orders_done = @orders.status_done.excepts(@sevent_orders).by_serving_time
  end

  private
    def get_orders
      @orders = Order.not_deleted
    end

end
