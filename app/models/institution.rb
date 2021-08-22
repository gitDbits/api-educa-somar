class Institution < ApplicationRecord
  extend FriendlyId
  friendly_id :cnpj, use: :slugged

  validates :cnpj, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
  validates :fantasy_name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, presence: true, uniqueness: true
end
