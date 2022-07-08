json.extract! coffee_bean, :id, :name, :image, :description, :slug, :created_at, :updated_at
json.url coffee_bean_url(coffee_bean, format: :json)
