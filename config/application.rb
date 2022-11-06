# frozen_string_literal: true

require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you"ve limited to :test, :development, or :production.require "view_component/engine"

Bundler.require(*Rails.groups)

module Langwire
  class Application < Rails::Application
    config.autoload_paths << Rails.root.join("app/frontend/components")
    config.eager_load_paths << Rails.root.join("app/frontend/components")
    config.view_component.preview_paths << Rails.root.join("app/frontend/components")
    config.importmap.cache_sweepers << Rails.root.join("app/frontend")

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    config.generators do |g|
      g.orm :aws_record
    end

    config.parzu_host = "http://localhost:5003/"
  end
end
