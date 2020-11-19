class Api::ErrorsController < ActionController::Base
	def render_404
		render 'api/errors/not_found', status: 404
	end

	def invalid_api_key
    render 'api/errors/invalid_api_key', status: 401
  end

  def must_specify_api_key
    render 'api/errors/must_specify_api_key', status: 401
  end

  def unauthorized
    render 'api/errors/unauthorized', status: 401 and return
  end

  def not_found
    render 'api/errors/not_found', status: 404 and return
  end

  def not_available(resource)
    @resource = resource
    render 'api/errors/not_available', status: 404 and return
  end

  def invalid_resource!(resource)
    @resource = resource
    render 'api/errors/invalid_resource', status: 422
  end
end