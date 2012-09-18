require File.expand_path('../boot', __FILE__)

require 'rails/all'

if defined?(Bundler)
  Bundler.require(*Rails.groups(:assets => %w(development test)))
end

module Thevideofeed
  class Application < Rails::Application
    config.encoding = "utf-8"
    config.filter_parameters += [:password]
    config.active_support.escape_html_entities_in_json = true
    config.active_record.whitelist_attributes = true
    config.assets.enabled = true
    config.assets.version = '1.0'
    config.autoload_paths << config.root.join('lib')
    config.session_store :cookie_store, key: '_thevideofeed_session'
    config.secret_token = ENV['SECRET_TOKEN'] || SecureRandom.hex
  end
end

ActiveSupport.on_load(:action_controller) do
  wrap_parameters format: [:json]
end

ActiveSupport.on_load(:active_record) do
  self.include_root_in_json = false
end
