class Admin::OrdersController < AdminController
  before_action :set_order, only: [:show, :edit, :update]

  def index
    @q = Order.ransack(params[:q])
    @pagy, @orders = pagy(@q.result.includes(:coffee_bean, :serving_method, :serving_type), items: 10)
  end

  def show
    
  end

  def update
    
  end

  def edit
    
  end


  def export
    respond_to do |format|
      format.html
      format.csv { send_data Order.to_csv, filename: "orders-jabar-lautan-kopi-2019-#{Time.current}.csv" }
    end
  end

  def truncate
    @orders = Order.all
    @orders.update_all(deleted: true)
    # DatabaseCleaner.allow_production = true
    # DatabaseCleaner.strategy = :truncation, {:only => %w[orders]}
    # DatabaseCleaner.clean

    redirect_to admin_orders_url, notice: "Order has been deleted"
  end

  private

    def set_order
      @order = Order.find(params[:id])
    end

end
