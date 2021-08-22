class  Api::V1::InstitutionsController < ApplicationController
  before_action :authorize_request
  before_action :set_institution, only: %i[show update destroy]

  def index
    @institutions = Institution.all
    render json: @institutions
  end

  def show
    render json: @institution
  end

  def create
    @institution = Institution.new(institution_params)

    if @institution.save
      render json: @institution, status: :created
    else
      render json: @institution.errors, status: :unprocessable_entity
    end
  end

  def update
    if @institution.update(institution_params)
      render json: @institution, status: :ok
    else
      render json: { errors: @institution.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if @institution.destroy
      render json: { messages: "Instituição excluída com sucesso"}, status: :ok
    else
      render json: { errors: @institution.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

    def set_institution
      @institution = Institution.friendly.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { errors: I18n.t(:institution_not_found) }, status: :not_found
    end

    def institution_params
      params.require(:institution).permit(:cnpj, :name, :email, :fantasy_name, :phone, :street, :number, :neighborhood, :zip_code, :university, :school, :uf)
    end
end
