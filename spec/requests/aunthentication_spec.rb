require 'rails_helper'

describe 'Aunthentication', type: :request do
  describe 'POST /aunthenticate' do
    it 'authenticates the client' do
      post '/api/v1/authenticate', params: { name: 'Morris' }

      expect(response).to have_http_status(:created)
    end
  end
end
