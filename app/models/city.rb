class City < ApplicationRecord
  belongs_to :state

  scope :capital , -> { 
    where(capital: true) 
    .order(:name)
  }
  
  scope :by_state, ->(state_acronym) { 
    joins(:state) 
      .where('states.acronym = ?', state_acronym)
      .order(:name)
  }
end
