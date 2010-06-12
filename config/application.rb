require File.expand_path('../boot', __FILE__)
require 'rails/all'
Bundler.require(:default, Rails.env) if defined?(Bundler)

module Thevideofeed
  class Application < Rails::Application
    # config.time_zone = 'Central Time (US & Canada)'
    config.encoding = "utf-8"
    config.filter_parameters += [:password]
  end
end
