class Api::V1::TrackingPixelsController < Api::BaseController
  before_action :set_tracking_pixel, only: [:update, :destroy]

  # GET /tracking_pixels
  def index
    @tracking_pixels = TrackingPixel.all

    render json: @tracking_pixels
  end

  # GET api/v1/tracking_pixels/1
  def show
    begin
      @tracking_pixel = TrackingPixel.find(params[:id])
      render json: @tracking_pixel
    rescue ActiveRecord::RecordNotFound
      puts 'Record Not Found'
      render 'api/errors/not_found', status: 404
    end
  end

  # POST /tracking_pixels
  def create
    @tracking_pixel = TrackingPixel.new
    @tracking_pixel.name = params[:name]
    @tracking_pixel.provider_id = params[:provider_id]

    if @tracking_pixel.save
      render json: @tracking_pixel
    else
      render json: @tracking_pixel.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT api/v1/tracking_pixels/1/converted
  def converted
    @tracking_pixel = TrackingPixel.find(params[:tracking_pixel_id])
    @tracking_pixel.converted = true 
    if @tracking_pixel.save
      render json: @tracking_pixel
    else
      render json: @tracking_pixel.errors, status: :unprocessable_entity
    end
  end    

  # PATCH/PUT api/v1/tracking_pixels/1
  def update
    @tracking_pixel.name = params[:name]
    @tracking_pixel.provider_id = params[:provider_id]   
    if @tracking_pixel.save
      render json: @tracking_pixel
    else
      render json: @tracking_pixel.errors, status: :unprocessable_entity
    end
  end

  # DELETE api/v1/tracking_pixels/1
  def destroy
    @tracking_pixel.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tracking_pixel
      @tracking_pixel = TrackingPixel.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tracking_pixel_params
      params.fetch(:tracking_pixel, {})
    end
end
