class Api::V1::StatesController < ApplicationController
  before_action :authorize_request
  before_action :set_states, only: %i[show update]

  def index
    @states = State.order(:name)
    render json: @states
  end

  def cities
    @cities = City.by_state(params[:id].upcase)
    render json: @cities
  end

  def show
    render json: @state
  end

  private

  def set_states
    @state = State.friendly.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    render json: { errors: I18n.t(:state_not_found) }, status: :not_found
  end

  def state_params
    params.require(:state).permit(:name, :acronym, :region_id)
  end
end