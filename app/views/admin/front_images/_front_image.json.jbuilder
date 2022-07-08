json.extract! front_image, :id, :image, :published, :name, :created_at, :updated_at
json.url admin_front_image_url(front_image, format: :json)
