require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Starlight
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # setup bower components folder for lookup
    config.assets.paths << Rails.root.join('vendor', 'assets', 'bower_components')
    # fonts
    config.assets.precompile << /\.(?:svg|eot|woff|ttf)$/
    # images
    config.assets.precompile << /\.(?:png|jpg)$/
    # precompile vendor assets
    config.assets.precompile += %w( base.js )
    config.assets.precompile += %w( base.css )
    # precompile themes
    config.assets.precompile += ['angle/themes/theme-a.css',
                                 'angle/themes/theme-b.css',
                                 'angle/themes/theme-c.css',
                                 'angle/themes/theme-d.css',
                                 'angle/themes/theme-e.css',
                                 'angle/themes/theme-f.css',
                                 'angle/themes/theme-g.css',
                                 'angle/themes/theme-h.css'
                                ]
    # Controller assets
    config.assets.precompile += [
                                 # Scripts
                                 'permissions.js',
                                 'roles.js',
                                 'nodes.js',
                                 'gateways.js',
                                 'company.js',
                                 'networks.js',
                                 'landings.js',
                                 'registrations.js',
                                 'lamps.js',
                                 'firmwares.js',
                                 'audits.js',
                                 'products.js',
                                 'lamp_stats.js',
                                 'gateway_stats.js',
                                 'tags.js',
                                 'config_files.js',
                                 'tasks.js',
                                 # Stylesheets
                                 'permissions.css',
                                 'roles.css',
                                 'nodes.css',
                                 'gateways.css',
                                 'company.css',
                                 'lamps.css',
                                 'networks.css',
                                 'registrations.css',
                                 'landings.css',
                                 'firmwares.css',
                                 'audits.css',
                                 'products.css',
                                 'lamp_stats.css',
                                 'gateway_stats.css',
                                 'tags.css',
                                 'config_files.css',
                                 'tasks.css'
                                ]


  end
end


