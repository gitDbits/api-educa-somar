class AddSlugToStates < ActiveRecord::Migration[6.1]
  def change
    add_column :states, :slug, :string
    add_index :states, :slug, unique: true
  end
end
