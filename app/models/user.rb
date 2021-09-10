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
  validates :password,
  length: { minimum: 6 },
  if: -> { new_record? || !password.nil? }
end