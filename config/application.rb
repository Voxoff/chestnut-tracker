require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Chestnut
  class Application < Rails::Application
    config.generators do |generate|
          generate.assets false
          generate.helper false
          generate.test_framework  :test_unit, fixture: false
        end
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    # config.autoload_paths += %W( lib/ )

    config.active_job.queue_adapter = :sidekiq

    config.middleware.insert_before 0, Rack::Cors do
      allow do
         origins '*'
         resource '*', :headers => :any, :methods => [:get, :post, :options]
       end
    end
    # Settings in config/environments/* take precedence over those specified here.
  end
end
