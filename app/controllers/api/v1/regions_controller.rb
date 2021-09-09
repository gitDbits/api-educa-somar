class Api::V1::RegionsController < ApplicationController
  before_action :authorize_request
  before_action :set_region, only: %i[show]

  def index
    @regions = Region.order(:name)
    render json: @regions
  end

  def show
    render json: @region
  end

  def set_region
    begin
      @region = Region.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { message: I18n.t(:region_not_found) }
    end
  end

  private

  def region_params
    params.require(:regions).permit(:name)
  end
end