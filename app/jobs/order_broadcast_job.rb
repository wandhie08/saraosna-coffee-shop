class OrderBroadcastJob < ApplicationJob
  queue_as :default

  def perform(order, action)
    # Do something later
    ActionCable.server.broadcast 'orders_channel', order: order, action: action
    $redis.set('coffee_app_orders', Order.includes(:serving_method, :serving_type, :coffee_bean).status_pending.latest.limit(12).to_json)
  end

  private

    def render(order)  
      ApplicationController.renderer.render(partial: 'orders/table_order', locals: {order: order, number: Order.status_pending.size})  
    end
    
end
