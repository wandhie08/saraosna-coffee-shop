class OrdersController < ApplicationController
  before_action :set_order, except: [:index, :redis_orders, :pickups, :clear_list]

  def index
    @orders = Order.not_deleted.status_pending.includes(:serving_method, :serving_type, :coffee_bean).latest
  end

  def redis_orders
    render json: $redis.get('coffee_app_orders')
  end

  def confirm
    if @order.status_processing?
      render json: {success: false, message: "Opss Order has been taken by another barista"}
    else
      @order.update_wating_time_and_status(1)
      # OrderActionJob.perform_later(@order, 'processing')
      render json: {success: true, message: "Order has been confirmed"}
    end
  end

  def confirm_done
    render json: {success: true, message: "Order has been confirmed"}
    @order.confirm_done!
    # OrderActionJob.perform_later(@order, 'done')
    MessageJob.perform_later(@order) unless Rails.env.development?
  end

  def confirm_delivered
    @order.status_delivered!
    render json: {success: true, message: "Order has been delivered to customer"}
  end

  def pickups
    @orders = Order.not_deleted.includes(:serving_method, :serving_type, :coffee_bean)
    @latest_sevent_orders = @orders.status_done.by_serving_time.limit(7)
    @orders_done = @orders.status_done.excepts(@latest_sevent_orders).by_serving_time
  end

  def clear_list
    @limit_orders = Order.not_deleted.status_done.by_serving_time.limit(7)
    @orders = Order.not_deleted.status_done.excepts(@limit_orders).by_serving_time
    @orders.update_all(status: 3)
    ActionCable.server.broadcast('orders_channel', order: @orders.first)
    render json: {success: true, message: "Order has been claered"}
  end

  def call_order
    params[:id].play('en', 1) if Rails.env.development?
    render json: {success: true, message: "called"}
  end

  def destroy
    @order.delete!
    # render json: {success: true, message: "Order has been canceled"}
    redirect_to orders_path, notice: "Order #{@order.queue_number} has ben canceled"
  end

  def show; end
  
  private
    
    def clear_all_order(orders)
      orders.map{|order| order.status_delivered! }
    end

    def set_order
      @order = Order.find(params[:id])
    end

end
