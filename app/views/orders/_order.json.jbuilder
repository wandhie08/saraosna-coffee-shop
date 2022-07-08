json.extract! order, :id, :status, :serving_method_id, :serving_type_id, :order_number, :coffee_bean_id, :queue_number, :created_at, :updated_at
json.url order_url(order, format: :json)
