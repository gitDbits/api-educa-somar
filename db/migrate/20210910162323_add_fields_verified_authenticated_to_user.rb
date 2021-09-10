class AddFieldsVerifiedAuthenticatedToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :active, :boolean, default: :true
    add_column :users, :approved, :boolean, default: :false
    add_column :users, :admin, :boolean, default: :false
    add_column :users, :student, :boolean, default: :false
    add_column :users, :teacher, :boolean, default: :false
  end
end
