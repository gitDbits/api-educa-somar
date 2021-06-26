require 'rails_helper'

describe 'Users API' do
  it 'return all users' do
    user = user.find_by(email: 'admin@educasomar.com.br')
    
    get '/api/v1/projects/1', as: :json, headers: {:Authorization => "Beaver eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2MjQyMTc5Nzl9.ZfNI3Lj83NO2wiEDhHinZLhOohxKYmJSRQxv72sU6ms"}
    
    expect(response).to have_http_status(:success)
  end
end
