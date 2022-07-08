require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CoffeeShop
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.active_job.queue_adapter = :delayed_job if Rails.env.production?

    config.time_zone = 'Asia/Jakarta'
    config.paths.add File.join('app', 'services'), glob: File.join('**', '*.rb')

    redis_config = Application.config_for(:redis)
    config.cache_store = [:redis_cache_store, { namespace: "cache-#{redis_config["namespace"]}", url: redis_config["url"], expires_in: 2.weeks }]

    config.generators do |generate|
      # generate.helper false
      generate.assets false
      # generate.view_specs false
    end

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', headers: :any, methods: [:get, :post, :options]
      end
    end

    config.assets.precompile << /\.(?:svg|eot|woff|ttf)\z/
    config.assets.paths << Rails.root.join("app", "assets", "fonts")

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
