class State < ApplicationRecord
  extend FriendlyId
  friendly_id :acronym, use: :slugged

  belongs_to :region
end
