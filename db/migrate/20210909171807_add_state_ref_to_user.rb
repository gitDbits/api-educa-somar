class AddStateRefToUser < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :state, foreign_key: true
  end
end
