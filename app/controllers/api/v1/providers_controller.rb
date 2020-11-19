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
    @provider = Provider.new
    @provider.name = params[:name]

    if @provider.save
      render json: @provider
    else
      render json: @provider.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT api/v1/providers/1
  def update
    @provider.name = params[:name]
    if @provider.save
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
      params.fetch(:provider, {})
    end
  
end