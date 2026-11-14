require_relative "boot"
require "rails/all"

Bundler.require(*Rails.groups)

module DemoBet
  class Application < Rails::Application
    config.load_defaults 8.0
    config.api_only = true
    config.autoload_paths << Rails.root.join("app/services")
  end
end
