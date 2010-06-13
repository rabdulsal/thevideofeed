ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

# load machinist models for Model.make
require File.expand_path(File.dirname(__FILE__) + "/blueprints")

class ActiveSupport::TestCase

  setup do
    Sham.reset
  end

end

class ActionController::TestCase
  include Devise::TestHelpers
end
