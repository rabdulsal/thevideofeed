class Admin::BaseController < ApplicationController
  layout 'admin'
  before_filter :http_authenticate

  protected

  def http_authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == CONFIG['admin_password']
    end
    warden.custom_failure! if performed?
  end

end