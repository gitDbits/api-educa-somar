json.extract! institution, :id, :cnpj, :name, :email, :fantasy_name, :phone, :street, :number, :neighborhood,
              :zip_code, :university, :school, :uf, :created_at, :updated_at
json.url institution_url(institution, format: :json)
