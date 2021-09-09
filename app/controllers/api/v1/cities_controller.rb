class Api::V1::CitiesController < ApplicationController
  before_action :authorize_request
  before_action :set_cities, only: %i[show update]

  def index
    @cities = City.order(:name)
    render json: @cities
  end

  def capital
    @cities = City.capital.order(:name)
    render json: @cities
  end

  def state
    @cities = City.by_state.order(:name)
    render json: @cities
  end

  def show
    render json: @city
  end

  private

  def set_cities
    @city = City.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    render json: { errors: I18n.t(:city_not_found) }, status: :not_found
  end

  def city_params
    params.require(:city).permit(:name, :capital, :state_id)
  end
end