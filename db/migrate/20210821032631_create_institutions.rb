class CreateInstitutions < ActiveRecord::Migration[6.1]
  def change
    create_table :institutions do |t|
      t.string :cnpj
      t.string :name
      t.string :email
      t.string :fantasy_name
      t.string :phone
      t.string :street
      t.string :number
      t.string :neighborhood
      t.string :zip_code
      t.boolean :university
      t.boolean :school
      t.string :uf

      t.timestamps
    end
  end
end
