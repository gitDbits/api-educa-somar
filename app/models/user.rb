class User < ApplicationRecord
  require 'cpf_cnpj'

  extend FriendlyId
  friendly_id :cpf, use: :slugged

  has_secure_password

  belongs_to :state
  belongs_to :city

  validates_with CpfValidator
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :cpf, presence: true, uniqueness: true
  validates :street, presence: true
  validates :number, presence: true 
  validates :neighborhood, presence: true 
  validates :zip_code, presence: true 
  validates :password,
  length: { minimum: 6 },
  if: -> { new_record? || !password.nil? }
end