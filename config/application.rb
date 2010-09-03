require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(:default, Rails.env) if defined?(Bundler)

# load config.yml and ENV (Heroku config vars included) into CONFIG hash
CONFIG = (YAML.load_file("config/config.yml")[Rails.env]).merge(ENV)

module Thevideofeed
  class Application < Rails::Application

    # for devise
    config.action_mailer.default_url_options = { :host => CONFIG['host'] }

    # Add additional load paths for your own custom dirs
    config.autoload_paths += %W( #{config.root}/lib )

    # Middleware
    config.middleware.use Rack::NoWWW if Rails.env.production?

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    config.time_zone = 'UTC'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    config.i18n.default_locale = :en

    # Configure generators values. Many other options are available, be sure to check the documentation.
    # config.generators do |g|
    #   g.orm             :active_record
    #   g.template_engine :erb
    #   g.test_framework  :test_unit, :fixture => true
    # end

    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password]
  end
end
