class AddColumnFieldsAddressToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :phone, :string, limit: 20
    add_column :users, :street, :string
    add_column :users, :number, :string, limit: 20
    add_column :users, :neighborhood, :string
    add_column :users, :zip_code, :string, limit: 20
  end
end
