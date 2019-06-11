require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Databank
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.autoload_paths += [
      config.root.join('app', 'policies'),
      config.root.join('app', 'services'),
      config.root.join('app', 'view_components')
    ]

    config.action_controller.include_all_helpers = false
  end
end
