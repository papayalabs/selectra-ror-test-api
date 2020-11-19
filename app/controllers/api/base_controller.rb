class Api::BaseController < ActionController::Base
  protect_from_forgery unless: -> { request.format.json? || request.format.xml? || request.format.csv?}

  attr_accessor :current_api_user

  before_action :set_content_type
  before_action :load_user
  before_action :authenticate_user

  def content_type
    case params[:format]
    when 'json'
      'application/json; charset=utf-8'
    when 'xml'
      'text/xml; charset=utf-8'
    end
  end

  private

  def requires_authentication?
    true
  end

  def set_content_type
    headers['Content-Type'] = content_type
  end


  def load_user
    @current_api_user = User.find_by_api_key(api_key.to_s)
  end

  def authenticate_user
    return if @current_api_user

    if requires_authentication? && api_key.blank? 
      must_specify_api_key and return
    elsif requires_authentication? && api_key.present? && @current_api_user == nil
      invalid_api_key and return
    else
      # An anonymous user
      @current_api_user = User.new
    end
  end

  def api_key
    request.headers['X-API-Token'] || params[:token]
  end
  helper_method :api_key

end
  
  