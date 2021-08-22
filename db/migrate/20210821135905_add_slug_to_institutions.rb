class AddSlugToInstitutions < ActiveRecord::Migration[6.1]
  def change
    add_column :institutions, :slug, :string
    add_index :institutions, :slug, unique: true
  end
end
