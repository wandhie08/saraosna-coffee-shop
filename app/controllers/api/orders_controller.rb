module Api  
  class OrdersController < BaseController
    before_action :set_order, only: [:show, :edit, :update, :destroy]
    before_action :check_available_bean, only: [:create]

    # GET /orders
    # GET /orders.json
    def index
      responder(200, 'Ok', OrderSerializer.new(Order.includes(:coffee_bean, :serving_method, :serving_type)))
    end

    # GET /orders/1
    # GET /orders/1.json
    def show
      responder(200, 'Ok', OrderSerializer.new(@order))
    end

    # GET /orders/new
    def new
      @order = Order.new
    end

    # GET /orders/1/edit
    def edit
    end

    # POST /orders
    # POST /orders.json
    def create
      @order = Order.new(order_params)
      if @order.save
        message = "Jabar Lautan Kopi 2019, No antrian : *#{@order.queue_number.to_s}*, Biji Kopi : *#{@order.coffee_bean.name}*, Metode Penyajian : *#{@order.serving_type.name}*, Estimasi waktu penyajian : *1-4 menit* .. mohon untuk dapat menunggu, Kami akan mengirimkan kembali pesan setelah Kopi anda selesai disajikan. "
        @response = WaServices.post("/WAsendMsg", :body => {userkey: ENV['WA_KEY'], passkey: ENV['WA_PASS'], instance: ENV['WA_INSTANCE'], nohp: params[:mobile_phone], pesan: message}.to_json)
        logger.info("===== response from wamessage #{@response.body}")
        if @response.code.eql? 200
          responder(200, 'Ok', OrderSerializer.new(@order))
        else
          @sms = SmsServices.get("/smsapi.php?userkey=#{ENV['SMS_KEY']}&passkey=#{ENV['SMS_PASS']}&nohp=#{order.mobile_phone}&pesan=#{message}")
          logger.info("===== response from wamessage #{@sms.body}")
          responder(200, "Order has been created but can't send message cuz #{JSON.parse(@response.body)['text']}", OrderSerializer.new(@order))
        end
      else
        responder(400, @order.errors.full_messages)
      end
      
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_order
        @order = Order.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def order_params
        params.permit(:serving_method_id, :serving_type_id, :coffee_bean_id, :mobile_phone)
      end

      def check_available_bean
        @coffee = CoffeeBean.find_by(id: params[:coffee_bean_id])
        return responder(404, "Bean not found") if @coffee.blank?
        return responder(401, "Oppss bean is not available") unless @coffee.available?
      end

  end
end
