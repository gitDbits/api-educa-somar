class Api::V1::UsersController < ApplicationController
  before_action :authorize_request, except: :create
  before_action :find_user, except: %i[create index]

  def index
    @users = User.all
  end

  def show; end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: { message: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    unless @user.update(user_params)
      render json: { message: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
  end

  private

  def find_user
    @user = User.find_by_email!(params[:_email])
  rescue ActiveRecord::RecordNotFound
    render json: { errors: I18n.t(:user_not_found) }, status: :not_found
  end

  def user_params
    params.permit(
      :name, :email, :password, :password_confirmation
    )
  end
end
