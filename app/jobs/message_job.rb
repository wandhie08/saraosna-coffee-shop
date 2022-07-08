class MessageJob < ApplicationJob
  queue_as :default

  def perform(order)
    message = "No Antrian *#{order.queue_number.to_s}* telah selesai diproses, pesanan dapat diambil di meja _*Counter*_ dengan memperlihatkan WA/SMS Nomor antrian Anda .. Terima Kasih"
    @response = WaServices.post("/WAsendMsg", :body => {userkey: ENV['WA_KEY'], passkey: ENV['WA_PASS'], instance: ENV['WA_INSTANCE'], nohp: params[:mobile_phone], pesan: message}.to_json)
    if @response.code.eql? 200
      Rails.logger.info("===== response from wamessage #{@response.body}")
    else
      @sms = SmsServices.get("/smsapi.php?userkey=#{ENV['SMS_KEY']}&passkey=#{ENV['SMS_PASS']}&nohp=#{order.mobile_phone}&pesan=#{message}")
      logger.info("===== response from wamessage #{@sms.body}")
      responder(200, "Order has been created but can't send message cuz #{JSON.parse(@response.body)['text']}", OrderSerializer.new(@order))
    end
  end
end
