class Api::V1::ProvidersController < Api::BaseController
  before_action :set_provider, only: [ :update, :destroy]

  # GET api/v1/providers
  def index
    @providers = Provider.all

    render json: @providers
  end

  # GET api/v1/providers/1
  def show
    begin
      @provider = Provider.find(params[:id])
      render json: @provider
    rescue ActiveRecord::RecordNotFound
      puts 'Record Not Found'
      render 'api/errors/not_found', status: 404
    end
  end

  # POST api/v1/providers
  def create
    @provider = Provider.new(provider_params)

    if @provider.save
      render json: @provider
    else
      render json: @provider.errors, status: :unprocessable_entity
    end
  end

  # POST api/v1/providers/:id/create_tracking_pixel
  def create_tracking_pixel
    @provider = Provider.find(params[:provider_id])
    @tracking_pixel = TrackingPixel.new
    @tracking_pixel.name = params[:name]
    @tracking_pixel.provider = @provider

    if @tracking_pixel.save
      render json: @tracking_pixel
    else
      render json: @tracking_pixel.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT api/v1/providers/1
  def update
    if @provider.update(provider_params)
      render json: @provider
    else
      render json: @provider.errors, status: :unprocessable_entity
    end
  end

  # DELETE api/v1/providers/1
  def destroy
    @provider.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_provider
      @provider = Provider.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def provider_params
      params.permit(:name)
    end
  
end