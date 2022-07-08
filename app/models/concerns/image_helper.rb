module ImageHelper
  extend ActiveSupport::Concern

  class_methods do
    def image_url(object)
      base_url+object.image.url
    end

    def image_event_url(event)
      {
        "large" => event.image.url,
        "small" => event.image.thumb.url
      }
    end

    def base_url
      if Rails.env.production?
        "https://coffeeapp.yana.work"
      else
        "http://localhost:7000"
      end
    end

  end

    

end